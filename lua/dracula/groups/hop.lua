local util = require("dracula.util")

local M = {}

M.url = "https://github.com/phaazon/hop.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    HopNextKey = { fg = c.search_alt, bold = true },
    HopNextKey1 = { fg = c.search, bold = true },
    HopNextKey2 = { fg = util.blend_bg(c.search, 0.6) },
    HopUnmatched = { fg = c.inactive },
  }
end

return M
