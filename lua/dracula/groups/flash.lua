local M = {}

M.url = "https://github.com/folke/flash.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    FlashBackdrop = { fg = c.inactive },
    FlashLabel = { bg = c.search_alt, bold = true, fg = c.fg },
  }
end

return M
