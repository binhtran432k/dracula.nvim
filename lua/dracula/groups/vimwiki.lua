local M = {}

M.url = "https://github.com/vimwiki/vimwiki"

---@type DraculaHighlightsFn
function M.get(c)
  -- stylua: ignore
  local ret = {
    VimwikiLink = { fg = c.purple, bg = c.none },
    VimwikiHeaderChar = { fg = c.yellow, bg = c.none },
    VimwikiHR = { fg = c.yellow, bg = c.none },
    VimwikiList = { fg = c.orange, bg = c.none },
    VimwikiTag = { fg = c.green, bg = c.none },
    VimwikiMarkers = { fg = c.purple, bg = c.none },
  }
  for i, color in ipairs(c.rainbow) do
    ret["VimwikiHeader" .. i] = { fg = color, bg = c.none, bold = true }
  end
  return ret
end

return M
