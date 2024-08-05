local M = {}

M.url = "https://github.com/goolord/alpha-nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    AlphaShortcut = { fg = c.orange },
    AlphaHeader = { fg = c.pink },
    AlphaHeaderLabel = { fg = c.orange },
    AlphaFooter = { fg = c.purple },
    AlphaButtons = { fg = c.cyan },
  }
end

return M
