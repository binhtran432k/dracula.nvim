local colors = require("dracula.colors").setup({ transform = true })
local config = require("dracula.config").options

local dracula = {}

dracula.normal = {
  a = { bg = colors.purple, fg = colors.black },
  b = { bg = colors.darker_bg, fg = colors.purple },
  c = { bg = colors.darker_bg, fg = colors.dark_fg },
}

dracula.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.darker_bg, fg = colors.green },
}

dracula.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.darker_bg, fg = colors.yellow },
}

dracula.visual = {
  a = { bg = colors.pink, fg = colors.black },
  b = { bg = colors.darker_bg, fg = colors.pink },
}

dracula.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.darker_bg, fg = colors.red },
}

dracula.terminal = {
  a = {bg = colors.cyan, fg = colors.black },
  b = {bg = colors.darker_bg, fg=colors.cyan },
}

dracula.inactive = {
  a = { bg = colors.darker_bg, fg = colors.purple },
  b = { bg = colors.darker_bg, fg = colors.dark_fg, gui = "bold" },
  c = { bg = colors.darker_bg, fg = colors.dark_fg },
}

if config.lualine_bold then
  for _, mode in pairs(dracula) do
    mode.a.gui = "bold"
  end
end

return dracula
