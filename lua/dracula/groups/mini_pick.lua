local M = {}

M.url = "https://github.com/echasnovski/mini.pick"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniPickBorder = "FloatBorder",
    MiniPickBorderBusy = "DiagnosticFloatingWarn",
    MiniPickBorderText = { fg = c.hint, bg = c.float_bg },
    MiniPickIconDirectory = "Directory",
    MiniPickIconFile = "MiniPickNormal",
    MiniPickHeader = "DiagnosticFloatingHint",
    MiniPickMatchCurrent = "CursorLine",
    MiniPickMatchMarked = "Visual",
    MiniPickMatchRanges = "DiagnosticFloatingHint",
    MiniPickNormal = "NormalFloat",
    MiniPickPreviewLine = "CursorLine",
    MiniPickPreviewRegion = "IncSearch",
    MiniPickPrompt = { fg = c.info, bg = c.float_bg },
  }
end

return M
