local util = require("dracula.util")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  local ret = {
    RenderMarkdownBullet = { fg = c.orange }, -- horizontal rule
    RenderMarkdownCode = { bg = c.dark.bg },
    RenderMarkdownDash = { fg = c.orange }, -- horizontal rule
    RenderMarkdownTableHead = { fg = c.red },
    RenderMarkdownTableRow = { fg = c.orange },
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline",
  }
  for i, color in ipairs(c.rainbow) do
    ret["RenderMarkdownH" .. i .. "Bg"] = { bg = util.blend_bg(color, 0.1) }
    ret["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
  end
  return ret
end

return M
