local util = require("dracula.util")

local M = {}

M.url = "https://github.com/TimUntersberger/neogit"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    NeogitBranch = { fg = c.pink },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.gutter.bg, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.gutter.fg, fg = c.purple },
    NeogitDiffContextHighlight = { bg = util.blend_bg(c.gutter.fg, 0.5), fg = c.dark.fg },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = util.blend_bg(c.diff.delete, 0.1) },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = util.blend_bg(c.diff.add, 0.1) },
  }
end

return M
