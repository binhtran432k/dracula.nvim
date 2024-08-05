local M = {}

M.url = "https://github.com/echasnovski/mini.clue"

---@type DraculaHighlightsFn
function M.get()
  return {
    MiniClueBorder = "FloatBorder",
    MiniClueDescGroup = "DiagnosticFloatingWarn",
    MiniClueDescSingle = "NormalFloat",
    MiniClueNextKey = "DiagnosticFloatingHint",
    MiniClueNextKeyWithPostkeys = "DiagnosticFloatingError",
    MiniClueSeparator = "DiagnosticFloatingInfo",
    MiniClueTitle = "FloatTitle",
  }
end

return M
