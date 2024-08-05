local M = {}

M.url = "https://github.com/echasnovski/mini.animate"

---@type DraculaHighlightsFn
function M.get()
  return {
    MiniAnimateCursor = { reverse = true, nocombine = true },
    MiniAnimateNormalFloat = "NormalFloat",
  }
end

return M
