local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    LeapMatch = { bg = c.search_alt, fg = c.fg, bold = true },
    LeapLabel = { fg = c.search, bold = true },
    LeapBackdrop = { fg = c.inactive },
  }
end

return M
