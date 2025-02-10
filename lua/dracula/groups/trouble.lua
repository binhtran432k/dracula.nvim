local M = {}

M.url = "https://github.com/folke/trouble.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    TroubleText = { fg = c.dark_fg },
    TroubleCount = { fg = c.pink, bg = c.gutter_fg },
    TroubleNormal = { fg = c.fg, bg = c.sidebar_bg },
  }
end

return M
