local M = {}

M.url = "https://github.com/echasnovski/mini.statusline"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniStatuslineDevinfo = { fg = c.dark_fg, bg = c.gutter_bg },
    MiniStatuslineFileinfo = { fg = c.dark_fg, bg = c.gutter_bg },
    MiniStatuslineFilename = { fg = c.dark_fg, bg = c.selection },
    MiniStatuslineInactive = { fg = c.purple, bg = c.statusline },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
    MiniStatuslineModeNormal = { fg = c.black, bg = c.purple, bold = true },
    MiniStatuslineModeOther = { fg = c.black, bg = c.teal, bold = true },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
    MiniStatuslineModeVisual = { fg = c.black, bg = c.pink, bold = true },
  }
end

return M
