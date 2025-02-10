local util = require("dracula.util")

local M = {}

M.url = "https://github.com/TimUntersberger/neogit"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    NeogitBranch = { fg = c.pink },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.gutter_bg, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.gutter_fg, fg = c.purple },
    NeogitDiffContextHighlight = { bg = util.blend_bg(c.gutter_fg, 0.5), fg = c.dark_fg },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = util.blend_bg(c.diff.delete, 0.1) },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = util.blend_bg(c.diff.add, 0.1) },
  }
end

return M
