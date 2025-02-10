local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@type DraculaHighlightsFn
function M.get(c)
  local ret = {
    CmpDocumentation = { fg = c.fg, bg = c.float_bg },
    CmpDocumentationBorder = { fg = c.border, bg = c.float_bg },
    CmpGhostText = { fg = c.inactive },
    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.gutter_fg, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.match_cmp, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.match_cmp, bg = c.none },
    CmpItemKindCodeium = { fg = c.teal, bg = c.none },
    CmpItemKindCopilot = { fg = c.teal, bg = c.none },
    CmpItemKindSupermaven = { fg = c.teal, bg = c.none },
    CmpItemKindDefault = { fg = c.dark_fg, bg = c.none },
    CmpItemKindTabNine = { fg = c.teal, bg = c.none },
    CmpItemMenu = { fg = c.comment, bg = c.none },
  }

  require("dracula.groups.kinds").kinds(ret, "CmpItemKind%s")
  return ret
end

return M
