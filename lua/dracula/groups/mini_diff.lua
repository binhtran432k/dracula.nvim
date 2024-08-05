local M = {}

M.url = "https://github.com/echasnovski/mini.diff"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MiniDiffOverAdd = "DiffAdd",
    MiniDiffOverChange = "DiffText",
    MiniDiffOverContext = "DiffChange",
    MiniDiffOverDelete = "DiffDelete",
    MiniDiffSignAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    MiniDiffSignChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    MiniDiffSignDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|
  }
end

return M
