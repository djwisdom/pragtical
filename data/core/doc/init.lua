local Object = require "core.object"
local Highlighter = require ".highlighter"
local translate = require ".translate"
local core = require "core"
local syntax = require "core.syntax"
local config = require "core.config"
local common = require "core.common"
local tokenizer = require "core.tokenizer"

---@class core.doc : core.object
local Doc = Object:extend()

function Doc:__tostring() return "Doc" end

local function split_lines(text)
  local res = {}
  for line in (text .. "\n"):gmatch("(.-)\n") do
    table.insert(res, line)
  end
  return res
end


function Doc:new(filename, abs_filename, new_file)
  self.new_file = new_file
  self.encoding = nil
  self.bom = nil
  self.binary = false
  self.cache = {}
  self:reset()
  if filename then
    self:set_filename(filename, abs_filename)
    if not new_file then
      self:load(abs_filename)
    end
  end
  if new_file then
    self.crlf = config.line_endings == "crlf"
  end
end


function Doc:reset()
  self.lines = { "\n" }
  self.selections = { 1, 1, 1, 1 }
  self.search_selections = {}
  self.last_selection = 1
  self.undo_stack = { idx = 1 }
  self.redo_stack = { idx = 1 }
  self.clean_change_id = 1
  self.highlighter = Highlighter(self)
  self.overwrite = false
  self:reset_syntax()
end


function Doc:clear_undo_redo()
  self.clean_change_id = 1
  self.undo_stack = { idx = 1 }
  self.redo_stack = { idx = 1 }
end


---Always returns a valid utf8 line even if the file contains binary data.
---@param idx integer
---@return string
function Doc:get_utf8_line(idx)
  if self.binary and self.clean_lines[idx] then
    return self.clean_lines[idx]
  end
  return self.lines[idx]
end


function Doc:reset_syntax()
  local header = self:get_text(1, 1, self:position_offset(1, 1, 128))
  local path = self.abs_filename
  if not path and self.filename then
    path = core.root_project().path .. PATHSEP .. self.filename
  end
  if path then path = common.normalize_path(path) end
  local syn = syntax.get(path, header)
  if self.syntax ~= syn then
    self.syntax = syn
    self.highlighter:soft_reset()
  end
end


function Doc:set_filename(filename, abs_filename)
  self.filename = filename
  self.abs_filename = abs_filename
  self:reset_syntax()
end


function Doc:needs_encoding_conversion()
  local charset = self.encoding
  if charset and charset ~= "UTF-8" and charset ~= "ASCII" then
    return true
  end
  return false
end


function Doc:load(filename)
  if not self.encoding then
    local errmsg
    self.encoding, self.bom, errmsg = encoding.detect(filename);
    if not self.encoding then
      core.error("%s", errmsg)
      self.encoding = "UTF-8"
    end
  elseif self.bom then
    self.bom = encoding.get_charset_bom(self.encoding)
  end
  local convert = self:needs_encoding_conversion()
  local fp = assert( io.open(filename, "rb") )
  self:reset()
  self.lines = {}
  self.clean_lines = {}
  local i = 1
  if convert then
    local content = fp:read("*a");
    content = assert(encoding.convert("UTF-8", self.encoding, content, {
      strict = false,
      handle_from_bom = true
    }))
    for line in content:gmatch("([^\n]*)\n?") do
      if line:byte(-1) == 13 then
        line = line:sub(1, -2)
        self.crlf = true
      end
      table.insert(self.lines, line .. "\n")
      self.highlighter.lines[i] = false
      i = i + 1
    end
    content = nil
  else
    for line in fp:lines() do
      if (i == 1) then line = encoding.strip_bom(line, "UTF-8") end
      if line:byte(-1) == 13 then
        line = line:sub(1, -2)
        self.crlf = true
      end
      table.insert(self.lines, line .. "\n")
      if not line:uisvalid() then
        self.binary = true
        self.clean_lines[i] = line:uclean("\26", true) .. "\n"
      end
      self.highlighter.lines[i] = false
      i = i + 1
    end
  end
  if #self.lines == 0 then
    table.insert(self.lines, "\n")
  end
  fp:close()
  self:reset_syntax()
end


function Doc:reload()
  if self.filename then
    local sel = { self:get_selection() }
    self:load(self.abs_filename)
    self:clean()
    self:set_selection(table.unpack(sel))
  end
end


local function open_for_writing(filename)
  local fp
  if PLATFORM == "Windows" then
    -- On Windows, opening a hidden file with wb fails with a permission error.
    -- To get around this, we must open the file as r+b and truncate.
    -- Since r+b fails if file doesn't exist, fall back to wb.
    fp = io.open(filename, "r+b")
    if fp then
      system.ftruncate(fp)
    else
      -- file probably doesn't exist, create one
      fp = assert ( io.open(filename, "wb") )
    end
  else
    fp = assert ( io.open(filename, "wb") )
  end
  return fp
end


function Doc:save(filename, abs_filename)
  if not filename then
    assert(self.filename, "no filename set to default to")
    filename = self.filename
    abs_filename = self.abs_filename
  else
    assert(self.filename or abs_filename, "calling save on unnamed doc without absolute path")
  end
  local fp
  local output = ""
  local convert = self:needs_encoding_conversion()
  if not convert then
    fp = open_for_writing(abs_filename)
    if self.bom then fp:write(self.bom) end
    for _, line in ipairs(self.lines) do
      if self.crlf then line = line:gsub("\n", "\r\n") end
      fp:write(line)
    end
  else
      output = table.concat(self.lines);
      if self.crlf then output = output:gsub("\n", "\r\n") end
  end
  local conversion_error = false
  if convert then
    local errmsg
    output, errmsg = encoding.convert(self.encoding, "UTF-8", output, {
      strict = true
    })
    if output then
      fp = open_for_writing(abs_filename)
      if self.bom then fp:write(self.bom) end
      fp:write(output)
      fp:close()
    else
      conversion_error = true
      core.error("%s", errmsg)
    end
  else
    fp:close()
  end
  self:set_filename(filename, abs_filename)
  if not conversion_error then
    self.new_file = false
  else
    self.new_file = true
  end
  self:clean()
end


function Doc:get_name()
  return self.filename or "unsaved"
end


function Doc:is_dirty()
  if self.new_file then
    if self.filename then return true end
    return #self.lines > 1 or #self:get_utf8_line(1) > 1
  else
    return self.clean_change_id ~= self:get_change_id()
  end
end


function Doc:clean()
  self.clean_change_id = self:get_change_id()
end


function Doc:get_indent_info()
  if not self.indent_info then return config.tab_type, config.indent_size, false end
  return self.indent_info.type or config.tab_type,
         self.indent_info.size or config.indent_size,
         self.indent_info.confirmed
end


function Doc:get_change_id()
  return self.undo_stack.idx
end

local function sort_positions(line1, col1, line2, col2)
  if line1 > line2 or line1 == line2 and col1 > col2 then
    return line2, col2, line1, col1, true
  end
  return line1, col1, line2, col2, false
end

-- Cursor section. Cursor indices are *only* valid during a get_selections() call.
-- Cursors will always be iterated in order from top to bottom. Through normal operation
-- curors can never swap positions; only merge or split, or change their position in cursor
-- order.
function Doc:get_selection(sort)
  local line1, col1, line2, col2, swap = self:get_selection_idx(self.last_selection, sort)
  if not line1 then
    line1, col1, line2, col2, swap = self:get_selection_idx(1, sort)
  end
  return line1, col1, line2, col2, swap
end


---Get the selection specified by `idx`
---@param idx integer @the index of the selection to retrieve
---@param sort? boolean @whether to sort the selection returned
---@return integer,integer,integer,integer,boolean? @line1, col1, line2, col2, was the selection sorted
function Doc:get_selection_idx(idx, sort)
  local line1, col1, line2, col2 = self.selections[idx*4-3], self.selections[idx*4-2], self.selections[idx*4-1], self.selections[idx*4]
  if line1 and sort then
    return sort_positions(line1, col1, line2, col2)
  else
    return line1, col1, line2, col2
  end
end

function Doc:get_selection_text(limit)
  limit = limit or math.huge
  local result = {}
  for idx, line1, col1, line2, col2 in self:get_selections() do
    if idx > limit then break end
    if line1 ~= line2 or col1 ~= col2 then
      local text = self:get_text(line1, col1, line2, col2)
      if text ~= "" then result[#result + 1] = text end
    end
  end
  return table.concat(result, "\n")
end

function Doc:has_selection()
  local line1, col1, line2, col2 = self:get_selection(false)
  return line1 ~= line2 or col1 ~= col2
end

function Doc:has_any_selection()
  for idx, line1, col1, line2, col2 in self:get_selections() do
    if line1 ~= line2 or col1 ~= col2 then return true end
  end
  return false
end

function Doc:sanitize_selection()
  for idx, line1, col1, line2, col2 in self:get_selections() do
    self:set_selections(idx, line1, col1, line2, col2)
  end
end

function Doc:set_selections(idx, line1, col1, line2, col2, swap, rm)
  assert(not line2 == not col2, "expected 3 or 5 arguments")
  if swap then line1, col1, line2, col2 = line2, col2, line1, col1 end
  line1, col1 = self:sanitize_position(line1, col1)
  line2, col2 = self:sanitize_position(line2 or line1, col2 or col1)
  common.splice(self.selections, (idx - 1)*4 + 1, rm == nil and 4 or rm, { line1, col1, line2, col2 })
end

function Doc:add_selection(line1, col1, line2, col2, swap)
  local l1, c1 = sort_positions(line1, col1, line2 or line1, col2 or col1)
  local target = #self.selections / 4 + 1
  for idx, tl1, tc1 in self:get_selections(true) do
    if l1 < tl1 or l1 == tl1 and c1 < tc1 then
      target = idx
      break
    end
  end
  self:set_selections(target, line1, col1, line2, col2, swap, 0)
  self.last_selection = target
end


function Doc:remove_selection(idx)
  if self.last_selection >= idx then
    self.last_selection = self.last_selection - 1
  end
  common.splice(self.selections, (idx - 1) * 4 + 1, 4)
end


function Doc:set_selection(line1, col1, line2, col2, swap)
  self.selections = {}
  self:set_selections(1, line1, col1, line2, col2, swap)
  self.last_selection = 1
end

function Doc:merge_cursors(idx)
  local table_index = idx and (idx - 1) * 4 + 1
  for i = (table_index or (#self.selections - 3)), (table_index or 5), -4 do
    for j = 1, i - 4, 4 do
      if self.selections[i] == self.selections[j] and
        self.selections[i+1] == self.selections[j+1] then
          common.splice(self.selections, i, 4)
          if self.last_selection >= (i+3)/4 then
            self.last_selection = self.last_selection - 1
          end
          break
      end
    end
  end
end

local function selection_iterator(invariant, idx)
  local target = invariant[3] and (idx*4 - 7) or (idx*4 + 1)
  if target > #invariant[1] or target <= 0 or (type(invariant[3]) == "number" and invariant[3] ~= idx - 1) then return end
  if invariant[2] then
    return idx+(invariant[3] and -1 or 1), sort_positions(table.unpack(invariant[1], target, target+4))
  else
    return idx+(invariant[3] and -1 or 1), table.unpack(invariant[1], target, target+4)
  end
end

-- If idx_reverse is true, it'll reverse iterate. If nil, or false, regular iterate.
-- If a number, runs for exactly that iteration.
function Doc:get_selections(sort_intra, idx_reverse)
  return selection_iterator, { self.selections, sort_intra, idx_reverse },
    idx_reverse == true and ((#self.selections / 4) + 1) or ((idx_reverse or -1)+1)
end
-- End of cursor seciton.

function Doc:sanitize_position(line, col)
  local nlines = #self.lines
  if line > nlines then
    return nlines, #self:get_utf8_line(nlines)
  elseif line < 1 then
    return 1, 1
  end
  return line, common.clamp(col, 1, #self:get_utf8_line(line))
end


local function position_offset_func(self, line, col, fn, ...)
  line, col = self:sanitize_position(line, col)
  return fn(self, line, col, ...)
end


local function position_offset_byte(self, line, col, offset)
  line, col = self:sanitize_position(line, col)
  col = col + offset
  while line > 1 and col < 1 do
    line = line - 1
    col = col + #self:get_utf8_line(line)
  end
  while line < #self.lines and col > #self:get_utf8_line(line) do
    col = col - #self:get_utf8_line(line)
    line = line + 1
  end
  return self:sanitize_position(line, col)
end


local function position_offset_linecol(self, line, col, lineoffset, coloffset)
  return self:sanitize_position(line + lineoffset, col + coloffset)
end


function Doc:position_offset(line, col, ...)
  if type(...) ~= "number" then
    return position_offset_func(self, line, col, ...)
  elseif select("#", ...) == 1 then
    return position_offset_byte(self, line, col, ...)
  elseif select("#", ...) == 2 then
    return position_offset_linecol(self, line, col, ...)
  else
    error("bad number of arguments")
  end
end


---Returns the content of the doc between two positions. </br>
---The positions will be sanitized and sorted. </br>
---The character at the "end" position is not included by default.
---@see core.doc.sanitize_position
---@param line1 integer
---@param col1 integer
---@param line2 integer
---@param col2 integer
---@param inclusive boolean? Whether or not to return the character at the last position
---@return string
function Doc:get_text(line1, col1, line2, col2, inclusive)
  line1, col1 = self:sanitize_position(line1, col1)
  line2, col2 = self:sanitize_position(line2, col2)
  line1, col1, line2, col2 = sort_positions(line1, col1, line2, col2)
  local col2_offset = inclusive and 0 or 1
  if line1 == line2 then
    return self.lines[line1]:sub(col1, col2 - col2_offset)
  end
  local lines = { self.lines[line1]:sub(col1) }
  for i = line1 + 1, line2 - 1 do
    table.insert(lines, self.lines[i])
  end
  table.insert(lines, self.lines[line2]:sub(1, col2 - col2_offset))
  return table.concat(lines)
end


function Doc:get_char(line, col)
  line, col = self:sanitize_position(line, col)
  return self:get_utf8_line(line):sub(col, col)
end


local function push_undo(undo_stack, time, type, ...)
  undo_stack[undo_stack.idx] = { type = type, time = time, ... }
  undo_stack[undo_stack.idx - config.max_undos] = nil
  undo_stack.idx = undo_stack.idx + 1
end


local function pop_undo(self, undo_stack, redo_stack, modified)
  -- pop command
  local cmd = undo_stack[undo_stack.idx - 1]
  if not cmd then return end
  undo_stack.idx = undo_stack.idx - 1

  -- handle command
  if cmd.type == "insert" then
    local line, col, text = table.unpack(cmd)
    self:raw_insert(line, col, text, redo_stack, cmd.time)
  elseif cmd.type == "remove" then
    local line1, col1, line2, col2 = table.unpack(cmd)
    self:raw_remove(line1, col1, line2, col2, redo_stack, cmd.time)
  elseif cmd.type == "selection" then
    self.selections = { table.unpack(cmd) }
    self:sanitize_selection()
  end

  modified = modified or (cmd.type ~= "selection")

  -- if next undo command is within the merge timeout then treat as a single
  -- command and continue to execute it
  local next = undo_stack[undo_stack.idx - 1]
  if next and math.abs(cmd.time - next.time) < config.undo_merge_timeout then
    return pop_undo(self, undo_stack, redo_stack, modified)
  end

  if modified then
    self:on_text_change("undo")
  end
end

local function update_clean_lines(self, line1, line2)
  if self.binary then
    for i=line1, line2 do
      local clean_text, was_valid = "", true
      if self.lines[i] then
        clean_text, was_valid = self.lines[i]:uclean("\26", true)
      end
      if self.clean_lines[i] then self.clean_lines[i] = nil end
      if not was_valid then self.clean_lines[i] = clean_text end
    end
  end
end


function Doc:clear_cache(l, n)
  for _, cache in pairs(self.cache) do
    local lines = l + n
    for ln=l-1, lines do
      local line = ln + 1
      if cache[line] then
        cache[line] = nil
      end
      if line == lines then break end
    end
  end
end


function Doc:raw_insert(line, col, text, undo_stack, time)
  -- split text into lines and merge with line at insertion point
  local lines = split_lines(text)
  local len = #lines[#lines]
  local before = self.lines[line]:sub(1, col - 1)
  local after = self.lines[line]:sub(col)
  for i = 1, #lines - 1 do
    lines[i] = lines[i] .. "\n"
  end
  lines[1] = before .. lines[1]
  lines[#lines] = lines[#lines] .. after

  -- splice lines into line array
  common.splice(self.lines, line, 1, lines)

  update_clean_lines(self, line, ((line + #lines - 1) == line) and line or #self.lines)

  -- keep cursors where they should be
  for idx, cline1, ccol1, cline2, ccol2 in self:get_selections(true, true) do
    if cline1 < line then break end
    local line_addition = (line < cline1 or col < ccol1) and #lines - 1 or 0
    local column_addition = line == cline1 and ccol1 > col and len or 0
    self:set_selections(idx, cline1 + line_addition, ccol1 + column_addition, cline2 + line_addition, ccol2 + column_addition)
  end

  -- push undo
  local line2, col2 = self:position_offset(line, col, #text)
  push_undo(undo_stack, time, "selection", table.unpack(self.selections))
  push_undo(undo_stack, time, "remove", line, col, line2, col2)

  -- update highlighter and assure selection is in bounds
  self.highlighter:insert_notify(line, #lines - 1)
  self:clear_cache(line, #lines - 1)
  self:sanitize_selection()
end


function Doc:raw_remove(line1, col1, line2, col2, undo_stack, time)
  -- push undo
  local text = self:get_text(line1, col1, line2, col2)
  push_undo(undo_stack, time, "selection", table.unpack(self.selections))
  push_undo(undo_stack, time, "insert", line1, col1, text)

  -- get line content before/after removed text
  local before = self.lines[line1]:sub(1, col1 - 1)
  local after = self.lines[line2]:sub(col2)

  local line_removal = line2 - line1
  local col_removal = col2 - col1

  -- splice line into line array
  common.splice(self.lines, line1, line_removal + 1, { before .. after })

  update_clean_lines(self, line1, line2 == line1 and line2 or #self.lines)

  local merge = false

  -- keep selections in correct positions: each pair (line, col)
  -- * remains unchanged if before the deleted text
  -- * is set to (line1, col1) if in the deleted text
  -- * is set to (line1, col - col_removal) if on line2 but out of the deleted text
  -- * is set to (line - line_removal, col) if after line2
  for idx, cline1, ccol1, cline2, ccol2 in self:get_selections(true, true) do
    if cline2 < line1 then break end
    local l1, c1, l2, c2 = cline1, ccol1, cline2, ccol2

    if cline1 > line1 or (cline1 == line1 and ccol1 > col1) then
      if cline1 > line2 then
        l1 = l1 - line_removal
      else
        l1 = line1
        c1 = (cline1 == line2 and ccol1 > col2) and c1 - col_removal or col1
      end
    end

    if cline2 > line1 or (cline2 == line1 and ccol2 > col1) then
      if cline2 > line2 then
        l2 = l2 - line_removal
      else
        l2 = line1
        c2 = (cline2 == line2 and ccol2 > col2) and c2 - col_removal or col1
      end
    end

    if l1 == line1 and c1 == col1 then merge = true end
    self:set_selections(idx, l1, c1, l2, c2)
  end

  if merge then
    self:merge_cursors()
  end

  -- update highlighter and assure selection is in bounds
  self.highlighter:remove_notify(line1, line_removal)
  self:clear_cache(line1, line_removal)
  self:sanitize_selection()
end


function Doc:insert(line, col, text)
  self.redo_stack = { idx = 1 }
  -- Reset the clean id when we're pushing something new before it
  if self:get_change_id() < self.clean_change_id then
    self.clean_change_id = -1
  end
  line, col = self:sanitize_position(line, col)
  self:raw_insert(line, col, text, self.undo_stack, system.get_time())
  self:on_text_change("insert")
end


function Doc:remove(line1, col1, line2, col2)
  self.redo_stack = { idx = 1 }
  line1, col1 = self:sanitize_position(line1, col1)
  line2, col2 = self:sanitize_position(line2, col2)
  line1, col1, line2, col2 = sort_positions(line1, col1, line2, col2)
  self:raw_remove(line1, col1, line2, col2, self.undo_stack, system.get_time())
  self:on_text_change("remove")
end


function Doc:undo()
  pop_undo(self, self.undo_stack, self.redo_stack, false)
end


function Doc:redo()
  pop_undo(self, self.redo_stack, self.undo_stack, false)
end


function Doc:text_input(text, idx)
  for sidx, line1, col1, line2, col2 in self:get_selections(true, idx or true) do
    if line1 ~= line2 or col1 ~= col2 then
      self:delete_to_cursor(sidx)
    end

    if self.overwrite
    and (line1 == line2 and col1 == col2)
    and col1 < #self:get_utf8_line(line1)
    and text:ulen(nil, nil, true) == 1 then
      self:remove(line1, col1, translate.next_char(self, line1, col1))
    end

    self:insert(line1, col1, text)
    self:move_to_cursor(sidx, #text)
  end
end


function Doc:ime_text_editing(text, start, length, idx)
  for sidx, line1, col1, line2, col2 in self:get_selections(true, idx or true) do
    if line1 ~= line2 or col1 ~= col2 then
      self:delete_to_cursor(sidx)
    end
    self:insert(line1, col1, text)
    self:set_selections(sidx, line1, col1 + #text, line1, col1)
  end
end


function Doc:replace_cursor(idx, line1, col1, line2, col2, fn)
  local old_text = self:get_text(line1, col1, line2, col2)
  local new_text, res = fn(old_text)
  if old_text ~= new_text then
    self:insert(line2, col2, new_text)
    self:remove(line1, col1, line2, col2)
    if line1 == line2 and col1 == col2 then
      line2, col2 = self:position_offset(line1, col1, #new_text)
      self:set_selections(idx, line1, col1, line2, col2)
    end
  end
  return res
end

function Doc:replace(fn)
  local has_selection, results = false, { }
  for idx, line1, col1, line2, col2 in self:get_selections(true) do
    if line1 ~= line2 or col1 ~= col2 then
      results[idx] = self:replace_cursor(idx, line1, col1, line2, col2, fn)
      has_selection = true
    end
  end
  if not has_selection then
    self:set_selection(table.unpack(self.selections))
    results[1] = self:replace_cursor(1, 1, 1, #self.lines, #self.lines[#self.lines], fn)
  end
  return results
end


function Doc:delete_to_cursor(idx, ...)
  for sidx, line1, col1, line2, col2 in self:get_selections(true, idx) do
    if line1 ~= line2 or col1 ~= col2 then
      self:remove(line1, col1, line2, col2)
    else
      local l2, c2 = self:position_offset(line1, col1, ...)
      self:remove(line1, col1, l2, c2)
      line1, col1 = sort_positions(line1, col1, l2, c2)
    end
    self:set_selections(sidx, line1, col1)
  end
  self:merge_cursors(idx)
end
function Doc:delete_to(...) return self:delete_to_cursor(nil, ...) end

function Doc:move_to_cursor(idx, ...)
  for sidx, line, col in self:get_selections(false, idx) do
    self:set_selections(sidx, self:position_offset(line, col, ...))
  end
  self:merge_cursors(idx)
end
function Doc:move_to(...) return self:move_to_cursor(nil, ...) end


function Doc:select_to_cursor(idx, ...)
  for sidx, line, col, line2, col2 in self:get_selections(false, idx) do
    line, col = self:position_offset(line, col, ...)
    self:set_selections(sidx, line, col, line2, col2)
  end
  self:merge_cursors(idx)
end
function Doc:select_to(...) return self:select_to_cursor(nil, ...) end


function Doc:get_indent_string(col)
  local indent_type, indent_size = self:get_indent_info()
  if indent_type == "hard" then
    return "\t"
  end
  return string.rep(" ", indent_size - ((col-1) % indent_size))
end

-- returns the size of the original indent, and the indent
-- in your config format, rounded either up or down
function Doc:get_line_indent(line, rnd_up)
  local _, e = line:find("^[ \t]+")
  local indent_type, indent_size = self:get_indent_info()
  local soft_tab = string.rep(" ", indent_size)
  if indent_type == "hard" then
    local indent = e and line:sub(1, e):gsub(soft_tab, "\t") or ""
    return e, indent:gsub(" +", rnd_up and "\t" or "")
  else
    local indent = e and line:sub(1, e):gsub("\t", soft_tab) or ""
    local number = #indent / #soft_tab
    return e, indent:sub(1,
      (rnd_up and math.ceil(number) or math.floor(number))*#soft_tab)
  end
end

-- un/indents text; behaviour varies based on selection and un/indent.
-- * if there's a selection, it will stay static around the
--   text for both indenting and unindenting.
-- * if you are in the beginning whitespace of a line, and are indenting, the
--   cursor will insert the exactly appropriate amount of spaces, and jump the
--   cursor to the beginning of first non whitespace characters
-- * if you are not in the beginning whitespace of a line, and you indent, it
--   inserts the appropriate whitespace, as if you typed them normally.
-- * if you are unindenting, the cursor will jump to the start of the line,
--   and remove the appropriate amount of spaces (or a tab).
function Doc:indent_text(unindent, line1, col1, line2, col2)
  local text = self:get_indent_string(col1)
  local _, se = self.lines[line1]:find("^[ \t]+")
  local in_beginning_whitespace = col1 == 1 or (se and col1 <= se + 1)
  local has_selection = line1 ~= line2 or col1 ~= col2
  if unindent or has_selection or in_beginning_whitespace then
    local l1d, l2d = #self.lines[line1], #self.lines[line2]
    for line = line1, line2 do
      if not has_selection or #self.lines[line] > 1 then -- don't indent empty lines in a selection
        local e, rnded = self:get_line_indent(self.lines[line], unindent)
        self:remove(line, 1, line, (e or 0) + 1)
        self:insert(line, 1,
          unindent and rnded:sub(1, #rnded - #text) or rnded .. text)
      end
    end
    l1d, l2d = #self.lines[line1] - l1d, #self.lines[line2] - l2d
    if (unindent or in_beginning_whitespace) and not has_selection then
      local start_cursor = (se and se + 1 or 1) + l1d or #(self.lines[line1])
      return line1, start_cursor, line2, start_cursor
    end
    return line1, col1 + l1d, line2, col2 + l2d
  end
  self:insert(line1, col1, text)
  return line1, col1 + #text, line1, col1 + #text
end

-- For plugins to add custom actions of document change
function Doc:on_text_change(type)
end

-- For plugins to get notified when a document is closed
function Doc:on_close()
  -- this shouldn't be needed but we do it to better hint the gc to collect
  self.highlighter.doc = nil
  self.highlighter.lines = nil

  core.log_quiet("Closed doc \"%s\"", self:get_name())
end

---Get the lua pattern used to match symbols taking into account current subsyntax.
---@return string
function Doc:get_symbol_pattern()
  local line = self:get_selection(true)
  local current_syntax = self.syntax
  if current_syntax and line > 1 then
    local state = self.highlighter:get_line(line - 1).state
    if state then
      local syntaxes = tokenizer.extract_subsyntaxes(current_syntax, state)
      for _, s in pairs(syntaxes) do
        if s.symbol_pattern then
          current_syntax = s
          break
        end
      end
    end
  end
  return (current_syntax and current_syntax.symbol_pattern)
    and current_syntax.symbol_pattern or config.symbol_pattern
end

---Get a string of characters not belonging to a word taking into account
---current subsyntax.
---
---Note: when setting `symbol` param to true the characters property
---`symbol_non_word_chars` will be searched, if false `non_word_chars`. In both
---cases will fallback to `config.non_word_chars` when not found.
---@param symbol boolean Indicates if non word characters are for a symbol
---@return string
function Doc:get_non_word_chars(symbol)
  local non_word_chars = symbol and "symbol_non_word_chars" or "non_word_chars"
  local line = self:get_selection(true)
  local current_syntax = self.syntax
  if current_syntax and line > 1 then
    local state = self.highlighter:get_line(line - 1).state
    if state then
      local syntaxes = tokenizer.extract_subsyntaxes(current_syntax, state)
      for _, s in pairs(syntaxes) do
        if s[non_word_chars] then
          current_syntax = s
          break
        end
      end
    end
  end
  return (current_syntax and current_syntax[non_word_chars])
    and current_syntax[non_word_chars] or config.non_word_chars
end


function Doc:add_search_selection(line1, col1, line2, col2)
  line1, col1, line2, col2 = sort_positions(line1, col1, line2, col2)
  local idx = string.format("%d:%d-%d:%d", line1, col1, line2, col2)
  self.search_selections[idx] = true
end

function Doc:is_search_selection(line1, col1, line2, col2)
  line1, col1, line2, col2 = sort_positions(line1, col1, line2, col2)
  local idx = string.format("%d:%d-%d:%d", line1, col1, line2, col2)
  if self.search_selections[idx] then return true end
  return false
end

function Doc:clear_search_selections()
  self.search_selections = {}
end


return Doc
