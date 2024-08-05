local M = {}

---@param opts? DraculaConfig
function M.setup(opts)
  opts = require("dracula.config").extend(opts)
  local colors = require("dracula.colors").setup(opts)
  local groups = require("dracula.groups").setup(colors, opts)

  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = require("dracula.util").get_style_name(opts)

  for group, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end

  if opts.terminal_colors then
    M.terminal(colors)
  end

  return colors, groups, opts
end

---@param colors DraculaColorScheme
function M.terminal(colors)
  -- dark
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_8 = colors.comment

  -- light
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_15 = colors.bright_white

  -- colors
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.bright_red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.bright_green

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.bright_yellow

  vim.g.terminal_color_4 = colors.purple
  vim.g.terminal_color_12 = colors.bright_blue

  vim.g.terminal_color_5 = colors.pink
  vim.g.terminal_color_13 = colors.bright_magenta

  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = colors.bright_cyan
end

return M
