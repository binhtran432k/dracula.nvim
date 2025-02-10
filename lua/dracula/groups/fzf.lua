local M = {}

M.url = "https://github.com/ibhagwan/fzf-lua"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    FzfLuaBorder = { fg = c.border, bg = c.float_bg },
    FzfLuaCursor = "IncSearch",
    FzfLuaDirPart = { fg = c.dark_fg },
    FzfLuaFilePart = "FzfLuaFzfNormal",
    FzfLuaFzfCursorLine = "Visual",
    FzfLuaFzfNormal = { fg = c.fg },
    FzfLuaFzfPointer = { fg = c.pink },
    FzfLuaFzfSeparator = { fg = c.orange, bg = c.float_bg },
    FzfLuaHeaderBind = "@punctuation.special",
    FzfLuaHeaderText = "Title",
    FzfLuaNormal = { fg = c.fg, bg = c.float_bg },
    FzfLuaPath = "Directory",
    FzfLuaPreviewTitle = { fg = c.border, bg = c.float_bg },
    FzfLuaTitle = { fg = c.orange, bg = c.float_bg },
  }
end

return M
