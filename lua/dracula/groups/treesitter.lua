local util = require("dracula.util")

local M = {}

---@type DraculaHighlightsFn
function M.get(c, opts)
  local ret = {
    ["@annotation"] = "PreProc",
    ["@attribute"] = "PreProc",
    ["@boolean"] = "Boolean",
    ["@character"] = "Character",
    ["@character.printf"] = "SpecialChar",
    ["@character.special"] = "SpecialChar",
    ["@comment"] = "Comment",
    ["@comment.error"] = { fg = c.error },
    ["@comment.hint"] = { fg = c.hint },
    ["@comment.info"] = { fg = c.info },
    ["@comment.note"] = { fg = c.hint },
    ["@comment.todo"] = { fg = c.todo },
    ["@comment.warning"] = { fg = c.warning },
    ["@constant"] = "Constant",
    ["@constant.builtin"] = "Special",
    ["@constant.macro"] = "Define",
    ["@constructor"] = { fg = c.cyan }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@diff.delta"] = "DiffChange",
    ["@diff.minus"] = "DiffDelete",
    ["@diff.plus"] = "DiffAdd",
    ["@function"] = "Function",
    ["@function.builtin"] = "Special",
    ["@function.call"] = "@function",
    ["@function.macro"] = "Macro",
    ["@function.method"] = "Function",
    ["@function.method.call"] = "@function.method",
    ["@keyword"] = { fg = c.pink, style = opts.styles.keywords }, -- For keywords that don't fall in previous categories.
    ["@keyword.conditional"] = "Conditional",
    ["@keyword.coroutine"] = "@keyword",
    ["@keyword.debug"] = { fg = c.pink, style = opts.styles.keywords },
    ["@keyword.directive"] = "PreProc",
    ["@keyword.directive.define"] = "Define",
    ["@keyword.exception"] = "Exception",
    ["@keyword.function"] = { fg = c.cyan, style = opts.styles.keywords }, -- For keywords used to define a fuction.
    ["@keyword.function.ruby"] = { fg = c.pink, style = opts.styles.keywords }, -- For keywords used to define a fuction.
    ["@keyword.include"] = { link = "Include" },
    ["@keyword.import"] = "Include",
    ["@keyword.operator"] = { fg = c.pink, style = opts.styles.keywords },
    ["@keyword.repeat"] = "Repeat",
    ["@keyword.return"] = "@keyword",
    ["@keyword.storage"] = "StorageClass",
    ["@label"] = { fg = c.cyan }, -- For labels: `label:` in C and `:label:` in Lua.
    ["@markup"] = "@none",
    ["@markup.emphasis"] = { italic = true },
    ["@markup.environment"] = "Macro",
    ["@markup.environment.name"] = "Type",
    ["@markup.heading"] = "Title",
    ["@markup.italic"] = { fg = c.yellow, italic = true },
    ["@markup.link"] = { fg = c.cyan },
    ["@markup.link.label"] = { fg = c.pink },
    ["@markup.link.label.symbol"] = "Identifier",
    ["@markup.link.url"] = "Underlined",
    ["@markup.list"] = { fg = c.cyan }, -- For special punctutation that does not fall in the catagories before.
    ["@markup.list.checked"] = { fg = c.green }, -- For brackets and parens.
    ["@markup.list.markdown"] = { fg = c.orange, bold = true },
    ["@markup.list.unchecked"] = { fg = c.cyan }, -- For brackets and parens.
    ["@markup.math"] = "Special",
    ["@markup.raw"] = "String",
    ["@markup.raw.markdown_inline"] = { bg = c.black, fg = c.green },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.strong"] = { fg = c.orange, bold = true },
    ["@markup.underline"] = { underline = true },
    ["@module"] = { fg = c.cyan }, -- modules or namespace
    ["@module.builtin"] = { fg = c.cyan, italic = true }, -- built-in modules or namespaces
    ["@namespace.builtin"] = "@variable.builtin",
    ["@none"] = {},
    ["@number"] = "Number",
    ["@number.float"] = "Float",
    ["@operator"] = { fg = c.pink }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@property"] = { fg = c.bright_green },
    ["@punctuation.bracket"] = { fg = c.dark.fg }, -- For brackets and parens.
    ["@punctuation.delimiter"] = { fg = c.fg }, -- For delimiters ie: `.`
    ["@punctuation.special"] = { fg = c.cyan }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@string"] = "String",
    ["@string.documentation"] = { fg = c.yellow },
    ["@string.escape"] = { fg = c.cyan }, -- For escape characters within a string.
    ["@string.regexp"] = { fg = c.red }, -- For regexes.
    ["@tag"] = "Label",
    ["@tag.attribute"] = "@property",
    ["@tag.delimiter"] = "Delimiter",
    ["@type"] = "Type",
    ["@type.builtin"] = { fg = c.cyan, italic = true },
    ["@type.definition"] = "Typedef",
    ["@type.qualifier"] = "@keyword",
    ["@variable"] = { fg = c.fg, style = opts.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = c.purple, italic = true }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.member"] = { fg = c.bright_green }, -- For fields.
    ["@variable.parameter"] = { fg = c.orange }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = util.blend(c.orange, 0.8, c.fg) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
  }

  for i, color in ipairs(c.rainbow) do
    ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
  end
  return ret
end

return M
