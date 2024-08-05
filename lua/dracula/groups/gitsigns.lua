local M = {}

M.url = "https://github.com/lewis6991/gitsigns.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|
  }
end

return M
