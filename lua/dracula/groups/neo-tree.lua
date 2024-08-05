local util = require("dracula.util")

local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"

---@type DraculaHighlightsFn
function M.get(c, opts)
  local dark = opts.styles.sidebars == "transparent" and c.none
    or util.blend(c.sidebar.bg, 0.8, opts.style == "day" and c.purple or "#000000")
  return {
    NeoTreeDimText = { fg = c.gutter.fg },
    NeoTreeFileName = { fg = c.sidebar.fg },
    NeoTreeGitModified = { fg = c.orange },
    NeoTreeGitStaged = { fg = c.green },
    NeoTreeGitUntracked = { fg = c.pink },
    NeoTreeNormal = { fg = c.sidebar.fg, bg = c.sidebar.bg },
    NeoTreeNormalNC = { fg = c.sidebar.fg, bg = c.sidebar.bg },
    NeoTreeTabActive = { fg = c.purple, bg = c.dark.bg, bold = true },
    NeoTreeTabInactive = { fg = c.inactive, bg = dark },
    NeoTreeTabSeparatorActive = { fg = c.purple, bg = c.dark.bg },
    NeoTreeTabSeparatorInactive = { fg = c.bg, bg = dark },
  }
end

return M
