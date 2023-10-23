local colors = require("dracula.colors").setup({ transform = true })

local dracula = {}

dracula.normal = {
	left = { { colors.black, colors.purple }, { colors.purple, colors.selection } },
	middle = { { colors.fg, colors.darker_bg } },
	right = { { colors.black, colors.purple }, { colors.purple, colors.selection } },
	error = { { colors.black, colors.red } },
	warning = { { colors.black, colors.yellow } },
}

dracula.insert = {
	left = { { colors.black, colors.green }, { colors.purple, colors.bg } },
}

dracula.visual = {
	left = { { colors.black, colors.pink }, { colors.purple, colors.bg } },
}

dracula.replace = {
	left = { { colors.black, colors.red }, { colors.purple, colors.bg } },
}

dracula.inactive = {
	left = { { colors.purple, colors.darker_bg }, { colors.darker_fg, colors.bg } },
	middle = { { colors.selection, colors.darker_bg } },
	right = { { colors.selection, colors.darker_bg }, { colors.darker_fg, colors.bg } },
}

dracula.tabline = {
	left = { { colors.darker_fg, colors.light_bg }, { colors.darker_fg, colors.bg } },
	middle = { { colors.selection, colors.darker_bg } },
	right = { { colors.selection, colors.darker_bg }, { colors.darker_fg, colors.bg } },
	tabsel = { { colors.purple, colors.selection }, { colors.darker_fg, colors.bg } },
}

return dracula
