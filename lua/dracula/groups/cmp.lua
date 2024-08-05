local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@type DraculaHighlightsFn
function M.get(c)
  local ret = {
    CmpDocumentation = { fg = c.fg, bg = c.float.bg },
    CmpDocumentationBorder = { fg = c.border, bg = c.float.bg },
    CmpGhostText = { fg = c.inactive },
    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.gutter.fg, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.cyan, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, bg = c.none },
    CmpItemKindCodeium = { fg = c.teal, bg = c.none },
    CmpItemKindCopilot = { fg = c.teal, bg = c.none },
    CmpItemKindDefault = { fg = c.dark.fg, bg = c.none },
    CmpItemKindTabNine = { fg = c.teal, bg = c.none },
    CmpItemMenu = { fg = c.comment, bg = c.none },
  }

  require("dracula.groups.kinds").kinds(ret, "CmpItemKind%s")
  return ret
end

return M
