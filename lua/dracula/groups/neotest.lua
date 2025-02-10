local M = {}

M.url = "https://github.com/nvim-neotest/neotest"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    NeotestAdapterName = { fg = c.pink, bold = true },
    NeotestBorder = { fg = c.border },
    NeotestDir = { fg = c.purple },
    NeotestExpandMarker = { fg = c.sidebar_fg },
    NeotestFailed = { fg = c.red },
    NeotestFile = { fg = c.teal },
    NeotestFocused = { fg = c.yellow },
    NeotestIndent = { fg = c.sidebar_fg },
    NeotestMarked = { fg = c.purple },
    NeotestNamespace = { fg = c.bright_green },
    NeotestPassed = { fg = c.green },
    NeotestRunning = { fg = c.yellow },
    NeotestSkipped = { fg = c.cyan },
    NeotestTarget = { fg = c.purple },
    NeotestTest = { fg = c.sidebar_fg },
    NeotestWinSelect = { fg = c.purple },
  }
end

return M
