local util = require("dracula.util")

local M = {}

M.url = "https://github.com/nvim-treesitter/nvim-treesitter-context"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    TreesitterContext = { bg = util.blend_bg(c.gutter.fg, 0.8) },
  }
end

return M
