local util = require("dracula.util")

local M = {}

M.url = "https://github.com/romgrk/barbar.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    BufferAlternate = { bg = c.gutter_fg, fg = c.fg },
    BufferAlternateERROR = { bg = c.gutter_fg, fg = c.error },
    BufferAlternateHINT = { bg = c.gutter_fg, fg = c.hint },
    BufferAlternateINFO = { bg = c.gutter_fg, fg = c.info },
    BufferAlternateIndex = { bg = c.gutter_fg, fg = c.info },
    BufferAlternateMod = { bg = c.gutter_fg, fg = c.warning },
    BufferAlternateSign = { bg = c.gutter_fg, fg = c.info },
    BufferAlternateTarget = { bg = c.gutter_fg, fg = c.red },
    BufferAlternateWARN = { bg = c.gutter_fg, fg = c.warning },
    BufferCurrent = { bg = c.bg, fg = c.fg },
    BufferCurrentERROR = { bg = c.bg, fg = c.error },
    BufferCurrentHINT = { bg = c.bg, fg = c.hint },
    BufferCurrentINFO = { bg = c.bg, fg = c.info },
    BufferCurrentIndex = { bg = c.bg, fg = c.info },
    BufferCurrentMod = { bg = c.bg, fg = c.warning },
    BufferCurrentSign = { bg = c.bg, fg = c.bg },
    BufferCurrentTarget = { bg = c.bg, fg = c.red },
    BufferCurrentWARN = { bg = c.bg, fg = c.warning },
    BufferInactive = { bg = util.blend_bg(c.gutter_bg, 0.4), fg = util.blend_bg(c.gutter_fg, 0.8) },
    BufferInactiveERROR = { bg = util.blend_bg(c.gutter_bg, 0.4), fg = util.blend_bg(c.red, 0.8) },
    BufferInactiveHINT = { bg = util.blend_bg(c.gutter_bg, 0.4), fg = util.blend_bg(c.teal, 0.8) },
    BufferInactiveINFO = { bg = util.blend_bg(c.gutter_bg, 0.4), fg = util.blend_bg(c.cyan, 0.8) },
    BufferInactiveIndex = { bg = util.blend_bg(c.gutter_bg, 0.4), fg = c.gutter_fg },
    BufferInactiveMod = { bg = util.blend_bg(c.gutter_bg, 0.4), fg = util.blend_bg(c.yellow, 0.8) },
    BufferInactiveSign = { bg = util.blend_bg(c.gutter_bg, 0.4), fg = c.bg },
    BufferInactiveTarget = { bg = util.blend_bg(c.gutter_bg, 0.4), fg = c.red },
    BufferInactiveWARN = { bg = util.blend_bg(c.gutter_bg, 0.4), fg = util.blend_bg(c.yellow, 0.8) },
    BufferOffset = { bg = c.statusline, fg = c.gutter_fg },
    BufferTabpageFill = { bg = util.blend_bg(c.gutter_bg, 0.8), fg = c.gutter_fg },
    BufferTabpages = { bg = c.statusline, fg = c.none },
    BufferVisible = { bg = c.statusline, fg = c.fg },
    BufferVisibleERROR = { bg = c.statusline, fg = c.error },
    BufferVisibleHINT = { bg = c.statusline, fg = c.hint },
    BufferVisibleINFO = { bg = c.statusline, fg = c.hint },
    BufferVisibleIndex = { bg = c.statusline, fg = c.info },
    BufferVisibleMod = { bg = c.statusline, fg = c.warning },
    BufferVisibleSign = { bg = c.statusline, fg = c.info },
    BufferVisibleTarget = { bg = c.statusline, fg = c.red },
    BufferVisibleWARN = { bg = c.statusline, fg = c.warning },
  }
end

return M
