local M = {}

M.url = "https://github.com/justinmk/vim-sneak"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    Sneak = { fg = c.gutter.bg, bg = c.pink },
    SneakScope = { bg = c.visual },
  }
end

return M
