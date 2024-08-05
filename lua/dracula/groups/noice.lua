local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  local ret = {
    NoiceCmdlineIconInput = { fg = c.yellow },
    NoiceCmdlineIconLua = { fg = c.cyan },
    NoiceCmdlinePopupBorderInput = { fg = c.yellow },
    NoiceCmdlinePopupBorderLua = { fg = c.cyan },
    NoiceCmdlinePopupTitleInput = { fg = c.yellow },
    NoiceCmdlinePopupTitleLua = { fg = c.cyan },
    NoiceCompletionItemKindDefault = { fg = c.dark.fg, bg = c.none },
  }
  require("dracula.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
  return ret
end

return M
