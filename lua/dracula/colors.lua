local util = require("dracula.util")

local M = {}

-- Color Palette
---@class Pallete
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
---@field bright_red string
---@field bright_green string
---@field bright_yellow string
---@field bright_blue string
---@field bright_magenta string
---@field bright_cyan string
---@field bright_white string
---@field teal string
---@field white string
---@field line_hl string
---@field border_hl string
---@field none_text string
---@field tab_drop_bg string
---@field none string
---@field dark_fg string
---@field darker_fg string
---@field lighter_bg string
---@field light_bg string
---@field dark_bg string
---@field darker_bg string
---@field visual_bg string
---@field add string
---@field delete string
---@field change string

---@return Pallete
M.default = function()
	local ret = {
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
		bright_red = "#FF6E6E",
		bright_green = "#69FF94",
		bright_yellow = "#FFFFA5",
		bright_blue = "#D6ACFF",
		bright_magenta = "#FF92DF",
		bright_cyan = "#A4FFFF",
		bright_white = "#FFFFFF",
	}

	ret.none = "NONE"
	ret.lighter_bg = "#424450"
	ret.light_bg = "#343746"
	ret.darker_bg = "#191A21"

	ret.white = ret.bright_white

	return ret
end

M.day = {}

M.soft = function()
	local ret = {
		bg = "#292A35", --
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
		white = "#F6F6F5",
		bright_red = "#E1837F",
		bright_green = "#97EDA2",
		bright_yellow = "#F6F6B6",
		bright_blue = "#D0B5F3",
		bright_magenta = "#E7A1D7",
		bright_cyan = "#BCF4F5",
		bright_white = "#FFFFFF",
	}

	ret.none = "NONE"
	ret.lighter_bg = "#4B5263"
	ret.light_bg = "#3B4048"
	ret.darker_bg = "#1C1C1C"

  return ret
end

---@return Pallete
function M.setup(opts)
	opts = opts or {}
	local config = require("dracula.config")

	local style = config.is_day() and config.options.light_style or config.options.style
	local palette = M[style] or {}
	if type(palette) == "function" then
		palette = palette()
	end

	local colors = vim.tbl_deep_extend("force", vim.deepcopy(M.default()), palette)

	colors.teal = util.blend(colors.green, colors.cyan, 0.6)

	colors.line_hl = util.blend(colors.selection, colors.bg, "75")
	colors.border_hl = util.blend(colors.purple, colors.bg, 0.8)
	colors.none_text = util.blend(colors.white, colors.bg, "1A")
	colors.tab_drop_bg = util.blend(colors.selection, colors.bg, "70")
	colors.dark_bg = colors.black
	colors.visual_bg = util.blend(colors.purple, colors.bg, 0.4)
	colors.dark_fg = util.blend(colors.fg, colors.bg, 0.8)
	colors.darker_fg = util.blend(colors.fg, colors.bg, 0.5)

	colors.add = util.blend(colors.green, colors.bg, 0.8)
	colors.delete = util.blend(colors.red, colors.bg, 0.8)
	colors.change = util.blend(colors.cyan, colors.bg, 0.8)

	config.options.on_colors(colors)
	if opts.transform and config.is_day() then
		util.invert_colors(colors)
	end

	return colors
end

return M
