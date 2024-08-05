local util = require("dracula.util")

local M = {}

M.url = "https://github.com/mfussenegger/nvim-dap"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    DapStoppedLine = { bg = util.blend_bg(c.warning, 0.1, c.bg) }, -- Used for "Warning" diagnostic virtual text
  }
end

return M
