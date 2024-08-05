local M = {}

M.url = "https://github.com/echasnovski/mini.starter"

---@type DraculaHighlightsFn
function M.get(c, opts)
  return {
    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = c.purple, italic = true },
    MiniStarterHeader = { fg = c.pink },
    MiniStarterInactive = { fg = c.comment, style = opts.styles.comments },
    MiniStarterItem = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    MiniStarterItemBullet = { fg = c.border },
    MiniStarterItemPrefix = { fg = c.yellow },
    MiniStarterQuery = { fg = c.cyan },
    MiniStarterSection = { fg = c.pink },
  }
end

return M
