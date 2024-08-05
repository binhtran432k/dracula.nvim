local M = {}

M.url = "https://github.com/echasnovski/mini.completion"

---@type DraculaHighlightsFn
function M.get()
  return {
    MiniCompletionActiveParameter = { underline = true },
  }
end

return M
