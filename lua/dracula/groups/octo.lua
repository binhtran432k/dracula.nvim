local util = require("dracula.util")

local M = {}

M.url = "https://github.com/pwntester/octo.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    OctoDetailsLabel = { fg = c.purple, bold = true },
    OctoDetailsValue = "@variable.member",
    OctoDirty = { fg = c.orange, bold = true },
    OctoIssueTitle = { fg = c.purple, bold = true },
    OctoStateChangesRequested = "DiagnosticVirtualTextWarn",
    OctoStateClosed = "DiagnosticVirtualTextError",
    OctoStateMerged = { bg = util.blend_bg(c.pink, 0.1), fg = c.pink },
    OctoStateOpen = "DiagnosticVirtualTextHint",
    OctoStatePending = "DiagnosticVirtualTextWarn",
    OctoStatusColumn = { fg = c.purple },
  }
end

return M
