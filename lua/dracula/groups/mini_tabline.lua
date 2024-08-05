local util = require("dracula.util")

local M = {}

M.url = "https://github.com/echasnovski/mini.tabline"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniTablineCurrent = { fg = c.fg, bg = c.gutter.fg },
    MiniTablineFill = { bg = c.black },
    MiniTablineHidden = { fg = c.gutter.fg, bg = c.statusline },
    MiniTablineModifiedCurrent = { fg = c.warning, bg = c.gutter.fg },
    MiniTablineModifiedHidden = { bg = c.statusline, fg = util.blend_bg(c.warning, 0.7) },
    MiniTablineModifiedVisible = { fg = c.warning, bg = c.statusline },
    MiniTablineTabpagesection = { bg = c.statusline, fg = c.none },
    MiniTablineVisible = { fg = c.fg, bg = c.statusline },
  }
end

return M
