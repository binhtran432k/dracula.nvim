local M = {}

M.url = "https://github.com/kyazdani42/nvim-tree.lua"

---@type DraculaHighlightsFn
function M.get(c, opts)
  return {
    NvimTreeFolderIcon = { bg = c.none, fg = c.purple },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeImageFile = { fg = c.sidebar_fg },
    NvimTreeIndentMarker = { fg = c.gutter_fg },
    NvimTreeNormal = { fg = c.sidebar_fg, bg = c.sidebar_bg },
    NvimTreeNormalNC = { fg = c.sidebar_fg, bg = c.sidebar_bg },
    NvimTreeOpenedFile = { bg = c.gutter_bg },
    NvimTreeRootFolder = { fg = c.purple, bold = true },
    NvimTreeSpecialFile = { fg = c.purple, underline = true },
    NvimTreeSymlink = { fg = c.teal },
    NvimTreeWinSeparator = {
      fg = opts.styles.sidebars == "transparent" and c.border or c.sidebar_bg,
      bg = c.sidebar_bg,
    },
  }
end

return M
