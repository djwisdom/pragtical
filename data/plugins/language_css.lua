-- mod-version:3
local syntax = require "core.syntax"

syntax.add {
  name = "CSS",
  files = { "%.css$" },
  block_comment = { "/*", "*/" },
  symbol_pattern = "[%a_%-#%.][%w_%-]*",
  symbol_non_word_chars = " \t\n/\\()\"':,;<>~!@$%^&*|+=[]{}`?",
  patterns = {
    { pattern = "\\.",                type = "normal"   },
    { pattern = { "/%*", "%*/" },     type = "comment"  },
    { pattern = { '"', '"', '\\' },   type = "string"   },
    { pattern = { "'", "'", '\\' },   type = "string"   },
    { pattern = "[%a][%w-]*%s*%f[:]", type = "keyword"  },
    { pattern = "#%x%x%x%x%x%x%f[%W]",type = "string"   },
    { pattern = "#%x%x%x%f[%W]",      type = "string"   },
    { pattern = "-?%d+[%d%.]*p[xtc]", type = "number"   },
    { pattern = "-?%d+[%d%.]*deg",    type = "number"   },
    { pattern = "-?%d+[%d%.]*cm",     type = "number"   },
    { pattern = "-?%d+[%d%.]*mm",     type = "number"   },
    { pattern = "-?%d+[%d%.]*in",     type = "number"   },
    { pattern = "-?%d+[%d%.]*r?ic",   type = "number"   },
    { pattern = "-?%d+[%d%.]*r?cap",  type = "number"   },
    { pattern = "-?%d+[%d%.]*r?em",   type = "number"   },
    { pattern = "-?%d+[%d%.]*r?lh",   type = "number"   },
    { pattern = "-?%d+[%d%.]*r?ch",   type = "number"   },
    { pattern = "-?%d+[%d%.]*r?ex",   type = "number"   },
    { pattern = "-?%d+[%d%.]*m?s",    type = "number"   },
    { pattern = "-?%d+[%d%.]*hz",     type = "number"   },
    { pattern = "-?%d+[%d%.]*Hz",     type = "number"   },
    { pattern = "-?%d+[%d%.]*vw",     type = "number"   },
    { pattern = "-?%d+[%d%.]*vh",     type = "number"   },
    { pattern = "-?%d+[%d%.]*vmin",   type = "number"   },
    { pattern = "-?%d+[%d%.]*vmax",   type = "number"   },
    { pattern = "-?%d+[%d%.]*vb",     type = "number"   },
    { pattern = "-?%d+[%d%.]*vi",     type = "number"   },
    { pattern = "-?%d+[%d%.]*%%",     type = "number"   },
    { pattern = "-?%d+[%d%.]*Q",      type = "number"   },
    { pattern = "-?%d+[%d%.]*cqw",    type = "number"   },
    { pattern = "-?%d+[%d%.]*cqh",    type = "number"   },
    { pattern = "-?%d+[%d%.]*cqi",    type = "number"   },
    { pattern = "-?%d+[%d%.]*cqb",    type = "number"   },
    { pattern = "-?%d+[%d%.]*cqmin",  type = "number"   },
    { pattern = "-?%d+[%d%.]*cqmax",  type = "number"   },
    { pattern = "-?%d+[%d%.]*",       type = "number"   },
    { pattern = "%-%-?[%a_][%w%-_]*", type = "constant" },
    { pattern = "[%a][%w%-]+%f[(]",   type = "function" },
    { pattern = "[%a_][%w%-_]*",      type = "symbol"   },
    { pattern = "#[%a][%w_-]*",       type = "keyword2" },
    { pattern = "@[%a][%w_-]*",       type = "keyword2" },
    { pattern = "%.[%a][%w_-]*",      type = "keyword2" },
    { pattern = "[{}:]",              type = "operator" },
  },
  symbols = {},
}