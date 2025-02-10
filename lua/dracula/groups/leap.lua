local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    LeapMatch = { bg = c.match_alt, fg = c.fg, bold = true },
    LeapLabel = { fg = c.match, bold = true },
    LeapBackdrop = { fg = c.inactive },
  }
end

return M
