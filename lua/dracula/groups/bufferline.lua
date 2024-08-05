local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    BufferLineIndicatorSelected = { fg = c.purple },
  }
end

return M
