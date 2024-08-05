local M = {}

M.url = "https://github.com/dense-analysis/ale"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    ALEErrorSign = { fg = c.error },
    ALEWarningSign = { fg = c.warning },
  }
end

return M
