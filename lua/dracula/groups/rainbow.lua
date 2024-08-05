local M = {}

M.url = "https://github.com/HiPhish/rainbow-delimiters.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    RainbowDelimiterRed = { fg = c.red },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterGreen = { fg = c.green },
    RainbowDelimiterBlue = { fg = c.purple },
    RainbowDelimiterViolet = { fg = c.pink },
    RainbowDelimiterCyan = { fg = c.cyan },
  }
end

return M
