local M = {}

M.url = "https://github.com/echasnovski/mini.trailspace"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniTrailspace = { bg = c.red },
  }
end

return M
