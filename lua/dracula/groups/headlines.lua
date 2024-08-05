local util = require("dracula.util")

local M = {}

M.url = "https://github.com/lukas-reineke/headlines.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  -- stylua: ignore
  local ret = {
    CodeBlock = { bg = c.dark.bg },
    Headline  = "Headline1",
  }

  for i, color in ipairs(c.rainbow) do
    ret["Headline" .. i] = { bg = util.blend_bg(color, 0.05) }
  end
  return ret
end

return M
