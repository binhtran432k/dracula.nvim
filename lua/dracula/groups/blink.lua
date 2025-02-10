local M = {}

M.url = "https://github.com/Saghen/blink.cmp"

---@type DraculaHighlightsFn
function M.get(c)
  local ret = {
    BlinkCmpDoc = { fg = c.fg, bg = c.float_bg },
    BlinkCmpDocBorder = { fg = c.border, bg = c.float_bg },
    BlinkCmpGhostText = { fg = c.inactive },
    BlinkCmpKindCodeium = { fg = c.teal, bg = c.none },
    BlinkCmpKindCopilot = { fg = c.teal, bg = c.none },
    BlinkCmpKindDefault = { fg = c.dark_fg, bg = c.none },
    BlinkCmpKindSupermaven = { fg = c.teal, bg = c.none },
    BlinkCmpKindTabNine = { fg = c.teal, bg = c.none },
    BlinkCmpLabel = { fg = c.fg, bg = c.none },
    BlinkCmpLabelDeprecated = { fg = c.gutter_fg, bg = c.none, strikethrough = true },
    BlinkCmpLabelMatch = { fg = c.match_cmp, bg = c.none },
    BlinkCmpMenu = { fg = c.comment, bg = c.float_bg },
    BlinkCmpMenuBorder = { fg = c.border, bg = c.float_bg },
    BlinkCmpSignatureHelp = { fg = c.fg, bg = c.float_bg },
    BlinkCmpSignatureHelpBorder = { fg = c.border, bg = c.float_bg },
  }

  require("dracula.groups.kinds").kinds(ret, "BlinkCmpKind%s")
  return ret
end

return M
