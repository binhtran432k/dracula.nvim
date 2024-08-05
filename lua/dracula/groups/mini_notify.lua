local M = {}

M.url = "https://github.com/echasnovski/mini.notify"

---@type DraculaHighlightsFn
function M.get()
  return {
    MiniNotifyBorder = "FloatBorder",
    MiniNotifyNormal = "NormalFloat",
    MiniNotifyTitle = "FloatTitle",
  }
end

return M
