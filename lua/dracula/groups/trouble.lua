local M = {}

M.url = "https://github.com/folke/trouble.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    TroubleText = { fg = c.dark.fg },
    TroubleCount = { fg = c.pink, bg = c.gutter.fg },
    TroubleNormal = { fg = c.fg, bg = c.sidebar.bg },
  }
end

return M
