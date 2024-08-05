local M = {}

M.url = "https://github.com/echasnovski/mini.operators"

---@type DraculaHighlightsFn
function M.get()
  return {
    MiniOperatorsExchangeFrom = "IncSearch",
  }
end

return M
