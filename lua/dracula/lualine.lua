local M = {}

---@param style? "day" | "default" | "soft"
function M.get(style)
  local colors, opts = require("dracula.colors").setup({ transform = true, style = style })

  local hl = {}

  hl.normal = {
    a = { bg = colors.purple, fg = colors.black },
    b = { bg = colors.statusline, fg = colors.purple },
    c = { bg = colors.statusline, fg = colors.dark.fg },
  }

  hl.insert = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.statusline, fg = colors.green },
  }

  hl.command = {
    a = { bg = colors.yellow, fg = colors.black },
    b = { bg = colors.statusline, fg = colors.yellow },
  }

  hl.visual = {
    a = { bg = colors.pink, fg = colors.black },
    b = { bg = colors.statusline, fg = colors.pink },
  }

  hl.replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.statusline, fg = colors.red },
  }

  hl.terminal = {
    a = { bg = colors.cyan, fg = colors.black },
    b = { bg = colors.statusline, fg = colors.cyan },
  }

  hl.inactive = {
    a = { bg = colors.statusline, fg = colors.purple },
    b = { bg = colors.statusline, fg = colors.dark.fg, gui = "bold" },
    c = { bg = colors.statusline, fg = colors.dark.fg },
  }

  if opts.lualine_bold then
    for _, mode in pairs(hl) do
      mode.a.gui = "bold"
    end
  end

  return hl
end

return M
