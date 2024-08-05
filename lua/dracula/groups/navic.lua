local M = {}

M.url = "https://github.com/SmiteshP/nvim-navic"

---@type DraculaHighlightsFn
function M.get(c)
  local ret = {
    NavicSeparator = { fg = c.fg, bg = c.none },
    NavicText = { fg = c.fg, bg = c.none },
  }
  require("dracula.groups.kinds").kinds(ret, "NavicIcons%s")
  return ret
end

return M
