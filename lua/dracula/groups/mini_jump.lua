local M = {}

M.url = "https://github.com/echasnovski/mini.jump"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniJump = { bg = c.pink, fg = c.white },
    MiniJump2dDim = "Comment",
    MiniJump2dSpot = { fg = c.pink, bold = true, nocombine = true },
    MiniJump2dSpotAhead = { fg = c.hint, bg = c.dark.bg, nocombine = true },
    MiniJump2dSpotUnique = { fg = c.orange, bold = true, nocombine = true },
  }
end

return M
