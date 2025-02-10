local colors = require("dracula.colors").setup({ transform = true })

local dracula = {}

dracula.normal = {
	left = { { colors.black, colors.purple }, { colors.purple, colors.selection } },
	middle = { { colors.fg, colors.statusline } },
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
	left = { { colors.purple, colors.statusline }, { colors.statusline, colors.bg } },
	middle = { { colors.selection, colors.statusline } },
	right = { { colors.selection, colors.statusline }, { colors.statusline, colors.bg } },
}

dracula.tabline = {
	left = { { colors.statusline, colors.gutter_bg }, { colors.statusline, colors.bg } },
	middle = { { colors.selection, colors.statusline } },
	right = { { colors.selection, colors.statusline }, { colors.statusline, colors.bg } },
	tabsel = { { colors.purple, colors.selection }, { colors.statusline, colors.bg } },
}

return dracula
