local M = {}

M.url = "https://github.com/kyazdani42/nvim-tree.lua"

---@type DraculaHighlightsFn
function M.get(c, opts)
  return {
    NvimTreeFolderIcon = { bg = c.none, fg = c.purple },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeImageFile = { fg = c.sidebar.fg },
    NvimTreeIndentMarker = { fg = c.gutter.fg },
    NvimTreeNormal = { fg = c.sidebar.fg, bg = c.sidebar.bg },
    NvimTreeNormalNC = { fg = c.sidebar.fg, bg = c.sidebar.bg },
    NvimTreeOpenedFile = { bg = c.gutter.bg },
    NvimTreeRootFolder = { fg = c.purple, bold = true },
    NvimTreeSpecialFile = { fg = c.purple, underline = true },
    NvimTreeSymlink = { fg = c.teal },
    NvimTreeWinSeparator = {
      fg = opts.styles.sidebars == "transparent" and c.border or c.sidebar.bg,
      bg = c.sidebar.bg,
    },
  }
end

return M
