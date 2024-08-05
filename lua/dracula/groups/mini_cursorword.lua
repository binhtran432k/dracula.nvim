local M = {}

M.url = "https://github.com/echasnovski/mini.cursorword"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniCursorword = { bg = c.selection },
    MiniCursorwordCurrent = { bg = c.selection },
  }
end

return M
