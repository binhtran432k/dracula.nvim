local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type DraculaHighlightsFn
function M.get(c, opts)
  return {
    WhichKey = { fg = c.cyan },
    WhichKeyGroup = { fg = c.purple },
    WhichKeyDesc = { fg = c.pink },
    WhichKeySeperator = { fg = c.comment },
    WhichKeyNormal = { bg = c.sidebar_bg },
    WhichKeyValue = { fg = c.sidebar_fg },
  }
end

return M
