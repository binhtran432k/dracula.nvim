local util = require("dracula.util")

local M = {}

---@class PurePallete
---@field bg string
---@field selection string
---@field fg string
---@field comment string
---@field cyan string
---@field green string
---@field orange string
---@field pink string
---@field purple string
---@field red string
---@field yellow string
---@field black string
---@field white string
---@field bright_red string
---@field bright_green string
---@field bright_yellow string
---@field bright_blue string
---@field bright_magenta string
---@field bright_cyan string
---@field bright_white string

---@class Pallete: PurePallete
---@field teal string
---@field git { add: string, delete: string, change: string, ignore: string }
---@field gitSigns { add: string, delete: string, change: string }
---@field diff { add: string, delete: string, change: string, text: string }
---@field error string
---@field warning string
---@field todo string
---@field info string
---@field hint string
---@field inactive string
---@field line string
---@field border string
---@field border_header string
---@field visual string
---@field search string
---@field search_alt string
---@field statusline string
---@field none string
---@field dark { fg: string, bg: string }
---@field gutter { fg: string, bg: string }
---@field popup { fg: string, bg: string }
---@field sidebar { fg: string, bg: string }
---@field float { fg: string, bg: string }

---@type PurePallete
M.default = {
  bg = "#282A36",
  selection = "#44475A",
  fg = "#F8F8F2",
  comment = "#6272A4",
  cyan = "#8BE9FD",
  green = "#50FA7B",
  orange = "#FFB86C",
  pink = "#FF79C6",
  purple = "#BD93F9",
  red = "#FF5555",
  yellow = "#F1FA8C",
  black = "#21222C",
  white = "#F8F8F2",
  bright_red = "#FF6E6E",
  bright_green = "#69FF94",
  bright_yellow = "#FFFFA5",
  bright_blue = "#D6ACFF",
  bright_magenta = "#FF92DF",
  bright_cyan = "#A4FFFF",
  bright_white = "#FFFFFF",
}

M.day = {}

---@type PurePallete
M.soft = {
  bg = "#292A35",
  fg = "#F6F6F5",
  selection = "#7C7F8A",
  comment = "#70747f",
  orange = "#FDC38E",
  black = "#21222C",
  red = "#DD6E6B",
  green = "#87E58E",
  yellow = "#E8EDA2",
  purple = "#BAA0E8",
  pink = "#E48CC1",
  cyan = "#A7DFEF",
  white = "#F6F6B6",
  bright_red = "#E1837F",
  bright_green = "#97EDA2",
  bright_yellow = "#F6F6B6",
  bright_blue = "#D0B5F3",
  bright_magenta = "#E7A1D7",
  bright_cyan = "#BCF4F5",
  bright_white = "#FFFFFF",
}

---@return Pallete
function M.setup(opts)
  opts = opts or {}
  local config = require("dracula.config")

  local style = config.is_day() and config.options.light_style or config.options.style
  local palette = M[style] or {}
  if type(palette) == "function" then
    palette = palette()
  end

  ---@type PurePallete
  local colors = vim.tbl_deep_extend("force", vim.deepcopy(M.default), palette)
  ---@cast colors Pallete

  local function make_alpha(color, alpha)
    return util.blend(color, colors.bg, alpha)
  end

  colors.none = "NONE"
  colors.teal = util.blend(colors.green, colors.cyan, 0.6)

  colors.git = {
    add = make_alpha(colors.green, 0.8),
    change = make_alpha(colors.cyan, 0.8),
    delete = make_alpha(colors.red, 0.8),
    ignore = make_alpha(colors.comment, 0.8),
  }
  colors.gitSigns = {
    add = make_alpha(colors.green, 0.8),
    change = make_alpha(colors.cyan, 0.8),
    delete = make_alpha(colors.red, 0.8),
  }
  colors.diff = {
    add = make_alpha(colors.green, 0.2),
    change = make_alpha(colors.cyan, 0.4),
    delete = make_alpha(colors.red, 0.5),
    text = make_alpha(colors.fg, 0.5),
  }

  colors.error = colors.bright_red
  colors.warning = colors.yellow
  colors.info = colors.cyan
  colors.hint = colors.teal
  colors.todo = colors.bright_cyan
  colors.inactive = make_alpha(colors.white, "4A")
  colors.line = make_alpha(colors.selection, "75")
  colors.border_header = colors.pink
  colors.border = make_alpha(colors.purple, 0.8)
  colors.visual = make_alpha(colors.purple, 0.4)
  colors.search = util.blend(colors.purple, "#0000ff", 0.5)
  colors.search_alt = util.blend(colors.pink, "#ff0000", 0.6)
  colors.statusline = util.blend(colors.bg, "#000000", 0.5)

  colors.dark = {
    fg = make_alpha(colors.fg, 0.8),
    bg = util.blend(colors.bg, "#000000", 0.7),
  }
  colors.gutter = {
    fg = make_alpha(colors.white, "3A"),
    bg = make_alpha(colors.selection, "70"),
  }
  colors.sidebar = {
    fg = make_alpha(colors.fg, 0.8),
    bg = config.options.styles.sidebars == "transparent" and colors.none
      or config.options.styles.sidebars == "dark" and colors.dark.bg
      or colors.bg,
  }
  colors.float = {
    fg = make_alpha(colors.fg, 0.8),
    bg = config.options.styles.floats == "transparent" and colors.none
      or config.options.styles.floats == "dark" and colors.dark.bg
      or colors.bg,
  }
  colors.popup = {
    fg = make_alpha(colors.fg, 0.8),
    bg = colors.dark.bg,
  }

  config.options.on_colors(colors)
  if opts.transform and config.is_day() then
    util.invert_colors(colors)
  end

  return colors
end

return M
