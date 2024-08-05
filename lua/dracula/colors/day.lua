local util = require("dracula.util")

---@param opts DraculaConfig
return function(opts)
  local style = opts.light_style == "day" and "default" or opts.light_style

  ---@type DraculaPalette
  local colors = vim.deepcopy(util.mod("dracula.colors." .. style))

  return colors, function(c)
    util.invert(c)
  end
end
