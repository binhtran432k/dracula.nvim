local M = {}

---@type {light?: DraculaStyle, dark?: DraculaStyle}
M.styles = {}

---@param opts? DraculaConfig
function M.load(opts)
  opts = require("dracula.config").extend(opts)
  local bg = vim.o.background
  local style_bg = opts.style == "day" and "light" or "dark"

  local colors_name = require("dracula.util").get_style_name(opts)

  if bg ~= style_bg then
    if vim.g.colors_name == colors_name then
      opts.style = bg == "light" and (M.styles.light or "day") or (M.styles.dark or "default")
    else
      vim.o.background = style_bg
    end
  end

  M.styles[vim.o.background] = opts.style
  return require("dracula.theme").setup(opts)
end

M.setup = require("dracula.config").setup

return M
