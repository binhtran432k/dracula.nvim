local M = {}

M.url = "https://github.com/nvimdev/indentmini.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    IndentLine = { fg = c.gutter.fg, nocombine = true },
    IndentLineCurrent = { fg = c.purple, nocombine = true },
  }
end

return M
