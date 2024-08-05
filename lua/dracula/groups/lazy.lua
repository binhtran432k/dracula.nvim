local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    LazyButtonActive = { bg = c.inactive },
    LazyH1 = { bg = c.border_header, fg = c.black },
    LazyProgressDone = { bold = true, fg = c.pink },
    LazyProgressTodo = { bold = true, fg = c.gutter.fg },
  }
end

return M
