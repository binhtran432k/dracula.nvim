local M = {}

M.url = "https://github.com/echasnovski/mini.indentscope"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniIndentscopeSymbol = { fg = c.purple, nocombine = true },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible
  }
end

return M
