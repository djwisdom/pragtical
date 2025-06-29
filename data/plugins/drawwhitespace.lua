-- mod-version:3

local core = require "core"
local style = require "core.style"
local Doc = require "core.doc"
local DocView = require "core.docview"
local common = require "core.common"
local command = require "core.command"
local config = require "core.config"
local Highlighter = require "core.doc.highlighter"

---Base configuration options.
---@class config.plugins.drawwhitespace.options
---Disable or enable the drawing of white spaces.
---@field enabled boolean
---Show white spaces at the beginning of a line.
---@field show_leading boolean
---Show white spaces at the end of a line.
---@field show_trailing boolean
---Show white spaces between words.
---@field show_middle boolean
---Show white spaces on selected text only.
---@field show_selected_only boolean
---Minimum amount of white spaces between words in order to show them.
---@field show_middle_min integer
---Default color used to render the white spaces.
---@field color renderer.color
---Color for leading white spaces.
---@field leading_color renderer.color
---Color for middle white spaces.
---@field middle_color renderer.color
---Color for trailing white spaces.
---@field trailing_color renderer.color

---Character substitution options.
---@class config.plugins.drawwhitespace.substitutions : config.plugins.drawwhitespace.options
---The character to substitute.
---@field char string
---The substitution character,
---@field sub string

---Configuration options for `drawwhitespace` plugin.
---@class config.plugins.drawwhitespace : config.plugins.drawwhitespace.options
---Character substitutions.
---@field substitutions config.plugins.drawwhitespace.substitutions[]
config.plugins.drawwhitespace = common.merge({
  enabled = false,
  show_leading = true,
  show_trailing = true,
  show_middle = true,
  show_selected_only = false,

  show_middle_min = 1,

  color = style.syntax.whitespace or style.syntax.comment,
  leading_color = nil,
  middle_color = nil,
  trailing_color = nil,

  substitutions = {
    {
      char = " ",
      sub = "·",
      -- You can put any of the previous options here too.
      -- For example:
      -- show_middle_min = 2,
      -- show_leading = false,
    },
    {
      char = "\t",
      sub = "»",
    },
    {
      char = "\26",
      sub = "█",
      show_leading = true,
      show_trailing = true,
      show_middle = true,
      binary_only = true
    },
  },

  config_spec = {
    name = "Draw Whitespace",
    {
      label = "Enabled",
      description = "Disable or enable the drawing of white spaces.",
      path = "enabled",
      type = "toggle",
      default = false
    },
    {
      label = "Show Leading",
      description = "Draw whitespaces starting at the beginning of a line.",
      path = "show_leading",
      type = "toggle",
      default = true,
    },
    {
      label = "Show Middle",
      description = "Draw whitespaces on the middle of a line.",
      path = "show_middle",
      type = "toggle",
      default = true,
    },
    {
      label = "Show Trailing",
      description = "Draw whitespaces on the end of a line.",
      path = "show_trailing",
      type = "toggle",
      default = true,
    },
    {
      label = "Show Selected Only",
      description = "Only draw whitespaces if it is within a selection.",
      path = "show_selected_only",
      type = "toggle",
      default = false,
    },
    {
      label = "Show Trailing as Error",
      description = "Uses an error square to spot them easily, requires 'Show Trailing' enabled.",
      path = "show_trailing_error",
      type = "toggle",
      default = false,
      on_apply = function(enabled)
        local found = nil
        local substitutions = config.plugins.drawwhitespace.substitutions
        for i, sub in ipairs(substitutions) do
          if sub.trailing_error then
            found = i
          end
        end
        if found == nil and enabled then
          table.insert(substitutions, {
            char = " ",
            sub = "█",
            show_leading = false,
            show_middle = false,
            show_trailing = true,
            trailing_color = style.error,
            trailing_error = true
          })
        elseif found ~= nil and not enabled then
          table.remove(substitutions, found)
        end
      end
    }
  }
}, config.plugins.drawwhitespace)


local ws_cache
local cached_settings
local function reset_cache()
  ws_cache = setmetatable({}, { __mode = "k" })
  local settings = config.plugins.drawwhitespace
  cached_settings = {
    show_leading = settings.show_leading,
    show_trailing = settings.show_trailing,
    show_middle = settings.show_middle,
    show_middle_min = settings.show_middle_min,
    color = settings.color,
    leading_color = settings.leading_color,
    middle_color = settings.middle_color,
    trailing_color = settings.trailing_color,
    substitutions = settings.substitutions,
  }
end
reset_cache()

local function reset_cache_if_needed()
  local settings = config.plugins.drawwhitespace
  if
    not ws_cache or
    cached_settings.show_leading       ~= settings.show_leading
    or cached_settings.show_trailing   ~= settings.show_trailing
    or cached_settings.show_middle     ~= settings.show_middle
    or cached_settings.show_middle_min ~= settings.show_middle_min
    or cached_settings.color           ~= settings.color
    or cached_settings.leading_color   ~= settings.leading_color
    or cached_settings.middle_color    ~= settings.middle_color
    or cached_settings.trailing_color  ~= settings.trailing_color
    -- we assume that the entire table changes
    or cached_settings.substitutions   ~= settings.substitutions
  then
    reset_cache()
  end
end

-- Move cache to make space for new lines
local prev_insert_notify = Highlighter.insert_notify
function Highlighter:insert_notify(line, n, ...)
  prev_insert_notify(self, line, n, ...)
  if not ws_cache[self] then
    ws_cache[self] = {}
  end
  local to = math.min(line + n, #self.doc.lines)
  for i=#self.doc.lines+n,to,-1 do
    ws_cache[self][i] = ws_cache[self][i - n]
  end
  for i=line,to do
    ws_cache[self][i] = nil
  end
end

-- Close the cache gap created by removed lines
local prev_remove_notify = Highlighter.remove_notify
function Highlighter:remove_notify(line, n, ...)
  prev_remove_notify(self, line, n, ...)
  if not ws_cache[self] then
    ws_cache[self] = {}
  end
  local to = math.max(line + n, #self.doc.lines)
  for i=line,to do
    ws_cache[self][i] = ws_cache[self][i + n]
  end
end

-- Remove changed lines from the cache
local prev_update_notify = Highlighter.update_notify
function Highlighter:update_notify(line, n, ...)
  prev_update_notify(self, line, n, ...)
  if not ws_cache[self] then
    ws_cache[self] = {}
  end
  for i=line,line+n do
    ws_cache[self][i] = nil
  end
end


local function get_option(substitution, option)
  if substitution[option] == nil then
    return config.plugins.drawwhitespace[option]
  end
  return substitution[option]
end

local draw_line_text = DocView.draw_line_text
function DocView:draw_line_text(idx, x, y)
  if
    not config.plugins.drawwhitespace.enabled
    or
    getmetatable(self) ~= DocView
  then
    return draw_line_text(self, idx, x, y)
  end

  local font = (self:get_font() or style.syntax_fonts["whitespace"] or style.syntax_fonts["comment"])
  local font_size = font:get_size()
  local _, indent_size = self.doc:get_indent_info()

  reset_cache_if_needed()
  if
    not ws_cache[self.doc.highlighter]
    or ws_cache[self.doc.highlighter].font ~= font
    or ws_cache[self.doc.highlighter].font_size ~= font_size
    or ws_cache[self.doc.highlighter].indent_size ~= indent_size
  then
    ws_cache[self.doc.highlighter] =
      setmetatable(
        { font = font, font_size = font_size, indent_size = indent_size },
        { __mode = "k" }
      )
  end

  if not ws_cache[self.doc.highlighter][idx] then -- need to cache line
    local cache = {}

    local tx
    local text = self.doc:get_utf8_line(idx)

    for _, substitution in pairs(config.plugins.drawwhitespace.substitutions) do
      if substitution.binary_only and not self.doc.binary then
        goto continue
      end

      local char = substitution.char
      local sub = substitution.sub
      local offset = 1

      local show_leading = get_option(substitution, "show_leading")
      local show_middle = get_option(substitution, "show_middle")
      local show_trailing = get_option(substitution, "show_trailing")

      local show_middle_min = get_option(substitution, "show_middle_min")

      local base_color = get_option(substitution, "color")
      local leading_color = get_option(substitution, "leading_color") or base_color
      local middle_color = get_option(substitution, "middle_color") or base_color
      local trailing_color = get_option(substitution, "trailing_color") or base_color

      local pattern = char.."+"
      while true do
        local s, e = text:find(pattern, offset)
        if not s then break end

        tx = self:get_col_x_offset(idx, s)

        local color = base_color
        local draw = false

        if e >= #text - 1 then
          draw = show_trailing
          color = trailing_color
        elseif s == 1 then
          draw = show_leading
          color = leading_color
        else
          draw = show_middle and (e - s + 1 >= show_middle_min)
          color = middle_color
        end

        if draw then
          local last_cache_idx = #cache
          -- We need to draw tabs one at a time because they might have a
          -- different size than the substituting character.
          -- This also applies to any other char if we use non-monospace fonts
          -- but we ignore this case for now.
          if char == "\t" then
            for i = s,e do
              tx = self:get_col_x_offset(idx, i)
              cache[last_cache_idx + 1] = sub
              cache[last_cache_idx + 2] = tx
              cache[last_cache_idx + 3] = font:get_width(sub)
              cache[last_cache_idx + 4] = color
              last_cache_idx = last_cache_idx + 4
            end
          else
            cache[last_cache_idx + 1] = string.rep(sub, e - s + 1)
            cache[last_cache_idx + 2] = tx
            cache[last_cache_idx + 3] = font:get_width(cache[last_cache_idx + 1])
            cache[last_cache_idx + 4] = color
          end
        end
        offset = e + 1
      end
      ::continue::
    end
    ws_cache[self.doc.highlighter][idx] = cache
  end

  -- draw from cache
  local x1, _, x2, _ = self:get_content_bounds()
  x1 = x1 + x
  x2 = x2 + x
  local ty = y + self:get_line_text_y_offset()
  local cache = ws_cache[self.doc.highlighter][idx]
  for i=1,#cache,4 do
    local tx = cache[i + 1] + x
    local tw = cache[i + 2]
    local sub = cache[i]
    local color = cache[i + 3]
    local partials = {}
    if config.plugins.drawwhitespace.show_selected_only and self.doc:has_any_selection() then
      for _, l1, c1, l2, c2 in self.doc:get_selections(true) do
        if idx > l1 and idx < l2 then
          -- Between selection lines, so everything is selected
          table.insert(partials, false)
        elseif idx == l1 and idx == l2 then
          -- Both ends of the selection are on the same line
          local _x1 = math.max(cache[i + 1], self:get_col_x_offset(idx, c1))
          local _x2 = math.min((cache[i + 1] + tw), self:get_col_x_offset(idx, c2))
          if _x1 < _x2 then
            table.insert(partials, {_x1 + x, 0, _x2 - _x1, math.huge})
          end
        elseif idx >= l1 and idx <= l2 then
          -- On one of the selection ends
          if idx == l1 then -- Start of the selection
            local _x = math.max(cache[i + 1], self:get_col_x_offset(idx, c1))
            table.insert(partials, {_x + x, 0, math.huge, math.huge})
          else -- End of the selection
            local _x = math.min((cache[i + 1] + tw), self:get_col_x_offset(idx, c2))
            table.insert(partials, {0, 0, _x + x, math.huge})
          end
        end
      end
    end

    if #partials == 0 and not config.plugins.drawwhitespace.show_selected_only then
      renderer.draw_text(font, sub, tx, ty, color)
    else
      for _, p in pairs(partials) do
        if p then core.push_clip_rect(table.unpack(p)) end
        renderer.draw_text(font, sub, tx, ty, color)
        if p then core.pop_clip_rect() end
      end
    end
  end

  return draw_line_text(self, idx, x, y)
end

local doc_on_close = Doc.on_close
function Doc:on_close()
  doc_on_close(self)
  if ws_cache[self.highlighter] then ws_cache[self.highlighter] = nil end
end


command.add(nil, {
  ["draw-whitespace:toggle"]  = function()
    config.plugins.drawwhitespace.enabled = not config.plugins.drawwhitespace.enabled
  end,

  ["draw-whitespace:disable"] = function()
    config.plugins.drawwhitespace.enabled = false
  end,

  ["draw-whitespace:enable"]  = function()
    config.plugins.drawwhitespace.enabled = true
  end,
})
