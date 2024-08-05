local M = {}

M.url = "https://github.com/lukas-reineke/indent-blankline.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    IndentBlanklineChar = { fg = c.gutter.fg, nocombine = true },
    IndentBlanklineContextChar = { fg = c.purple, nocombine = true },
    IblIndent = { fg = c.gutter.fg, nocombine = true },
    IblScope = { fg = c.purple, nocombine = true },
  }
end

return M
