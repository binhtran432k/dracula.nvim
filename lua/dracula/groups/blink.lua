local M = {}

M.url = "https://github.com/Saghen/blink.cmp"

---@type DraculaHighlightsFn
function M.get(c)
  local ret = {
    BlinkCmpDoc = { fg = c.fg, bg = c.float.bg },
    BlinkCmpDocBorder = { fg = c.border, bg = c.float.bg },
    BlinkCmpGhostText = { fg = c.inactive },
    BlinkCmpKindCodeium = { fg = c.teal, bg = c.none },
    BlinkCmpKindCopilot = { fg = c.teal, bg = c.none },
    BlinkCmpKindDefault = { fg = c.dark.fg, bg = c.none },
    BlinkCmpKindSupermaven = { fg = c.teal, bg = c.none },
    BlinkCmpKindTabNine = { fg = c.teal, bg = c.none },
    BlinkCmpLabel = { fg = c.fg, bg = c.none },
    BlinkCmpLabelDeprecated = { fg = c.gutter.fg, bg = c.none, strikethrough = true },
    BlinkCmpLabelMatch = { fg = c.cyan, bg = c.none },
    BlinkCmpMenu = { fg = c.comment, bg = c.float.bg },
    BlinkCmpMenuBorder = { fg = c.border, bg = c.float.bg },
    BlinkCmpSignatureHelp = { fg = c.fg, bg = c.float.bg },
    BlinkCmpSignatureHelpBorder = { fg = c.border, bg = c.float.bg },
  }

  require("dracula.groups.kinds").kinds(ret, "BlinkCmpKind%s")
  return ret
end

return M
