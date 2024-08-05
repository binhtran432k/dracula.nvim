local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type DraculaHighlightsFn
function M.get(c, opts)
  return {
    WhichKey = { fg = c.cyan },
    WhichKeyGroup = { fg = c.purple },
    WhichKeyDesc = { fg = c.pink },
    WhichKeySeperator = { fg = c.comment },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyNormal = { bg = c.sidebar.bg },
    WhichKeyValue = { fg = c.sidebar.fg },
  }
end

return M
