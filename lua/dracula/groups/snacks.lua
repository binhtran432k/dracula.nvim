local util = require("dracula.util")

local M = {}

M.url = "https://github.com/folke/snacks.nvim"

---@type DraculaHighlightsFn
function M.get(c, opts)
  local ret = {
    SnacksNotifierDebug = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderDebug = { fg = util.blend_bg(c.comment, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconDebug = { fg = c.comment },
    SnacksNotifierTitleDebug = { fg = c.comment },
    SnacksNotifierError = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderError = { fg = util.blend_bg(c.error, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconError = { fg = c.error },
    SnacksNotifierTitleError = { fg = c.error },
    SnacksNotifierInfo = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderInfo = { fg = util.blend_bg(c.info, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconInfo = { fg = c.info },
    SnacksNotifierTitleInfo = { fg = c.info },
    SnacksNotifierTrace = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderTrace = { fg = util.blend_bg(c.purple, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconTrace = { fg = c.purple },
    SnacksNotifierTitleTrace = { fg = c.purple },
    SnacksNotifierWarn = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderWarn = { fg = util.blend_bg(c.warning, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconWarn = { fg = c.warning },
    SnacksNotifierTitleWarn = { fg = c.warning },
    -- Dashboard
    SnacksDashboardDesc = { fg = c.cyan },
    SnacksDashboardFooter = { fg = c.purple },
    SnacksDashboardHeader = { fg = c.pink },
    SnacksDashboardIcon = { fg = c.pink },
    SnacksDashboardKey = { fg = c.orange },
    SnacksDashboardSpecial = { fg = c.green },
    SnacksDashboardDir = { fg = c.purple },
    -- Picker
    SnacksPickerMatch = { fg = c.match_cmp },
  }

  for i, color in ipairs(c.rainbow) do
    ret["SnacksIndent" .. i] = { fg = color, nocombine = true }
  end

  return ret
end

return M
