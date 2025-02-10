local M = {}

M.url = "https://github.com/echasnovski/mini.icons"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniIconsAzure = { fg = c.cyan },
    MiniIconsBlue = { fg = c.match_cmp },
    MiniIconsCyan = { fg = c.bright_cyan },
    MiniIconsGreen = { fg = c.green },
    MiniIconsGrey = { fg = c.fg },
    MiniIconsOrange = { fg = c.orange },
    MiniIconsPurple = { fg = c.purple },
    MiniIconsRed = { fg = c.red },
    MiniIconsYellow = { fg = c.yellow },
  }
end

return M
