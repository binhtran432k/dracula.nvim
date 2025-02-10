local M = {}

M.url = "https://github.com/stevearc/aerial.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  local ret = {
    AerialNormal = { fg = c.fg, bg = c.none },
    AerialGuide = { fg = c.gutter_fg },
    AerialLine = "LspInlayHint",
  }
  require("dracula.groups.kinds").kinds(ret, "Aerial%sIcon")
  return ret
end

return M
