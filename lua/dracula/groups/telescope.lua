local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    TelescopeTitle = { fg = c.border_header, bg = c.float_bg },
    TelescopeBorder = { fg = c.border, bg = c.float_bg },
    TelescopeNormal = { fg = c.fg, bg = c.float_bg },
    TelescopePromptBorder = { fg = c.bright_blue, bg = c.float_bg },
  }
end

return M
