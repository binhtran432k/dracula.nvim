local c = require("dracula.colors").setup({ transform = true })

local M = {
  normal = { bg = c.none, fg = c.dark_fg },

  ellipsis = { fg = c.statusline },
  separator = { fg = c.statusline },
  modified = { fg = c.yellow },

  dirname = { fg = c.statusline },
  basename = { fg = c.dark_fg, bold = true },
  context = { fg = c.dark_fg },

  context_file = { fg = c.dark_fg },
  context_module = { fg = c.yellow },
  context_namespace = { fg = c.yellow },
  context_package = { fg = c.purple },
  context_class = { fg = c.orange },
  context_method = { fg = c.purple },
  context_property = { fg = c.green },
  context_field = { fg = c.green },
  context_constructor = { fg = c.purple },
  context_enum = { fg = c.orange },
  context_interface = { fg = c.orange },
  context_function = { fg = c.purple },
  context_variable = { fg = c.pink },
  context_constant = { fg = c.pink },
  context_string = { fg = c.green },
  context_number = { fg = c.orange },
  context_boolean = { fg = c.orange },
  context_array = { fg = c.orange },
  context_object = { fg = c.orange },
  context_key = { fg = c.purple },
  context_null = { fg = c.purple },
  context_enum_member = { fg = c.green },
  context_struct = { fg = c.orange },
  context_event = { fg = c.orange },
  context_operator = { fg = c.green },
  context_type_parameter = { fg = c.green },
}

return M
