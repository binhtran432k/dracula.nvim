local M = {}

M.url = "https://github.com/petertriho/nvim-scrollbar"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    ScrollbarError = { fg = c.error, bg = c.none },
    ScrollbarErrorHandle = { fg = c.error, bg = c.gutter.bg },
    ScrollbarHandle = { fg = c.none, bg = c.gutter.bg },
    ScrollbarHint = { fg = c.hint, bg = c.none },
    ScrollbarHintHandle = { fg = c.hint, bg = c.gutter.bg },
    ScrollbarInfo = { fg = c.info, bg = c.none },
    ScrollbarInfoHandle = { fg = c.info, bg = c.gutter.bg },
    ScrollbarMisc = { fg = c.purple, bg = c.none },
    ScrollbarMiscHandle = { fg = c.purple, bg = c.gutter.bg },
    ScrollbarSearch = { fg = c.orange, bg = c.none },
    ScrollbarSearchHandle = { fg = c.orange, bg = c.gutter.bg },
    ScrollbarWarn = { fg = c.warning, bg = c.none },
    ScrollbarWarnHandle = { fg = c.warning, bg = c.gutter.bg },
  }
end

return M
