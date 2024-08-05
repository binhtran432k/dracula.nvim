local M = {}

M.url = "https://github.com/gbprod/yanky.nvim"

---@type DraculaHighlightsFn
function M.get()
  return {
    YankyPut = "Search",
    YankyYanked = "IncSearch",
  }
end

return M
