local M = {}

M.url = "https://github.com/lambdalisue/glyph-palette.vim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    GlyphPalette1 = { fg = c.red },
    GlyphPalette2 = { fg = c.green },
    GlyphPalette3 = { fg = c.yellow },
    GlyphPalette4 = { fg = c.purple },
    GlyphPalette6 = { fg = c.teal },
    GlyphPalette7 = { fg = c.fg },
    GlyphPalette9 = { fg = c.orange },
  }
end

return M
