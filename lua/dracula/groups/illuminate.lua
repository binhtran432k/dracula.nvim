local M = {}

M.url = "https://github.com/RRethy/vim-illuminate"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    IlluminatedWordRead = { bg = c.gutter.fg },
    IlluminatedWordText = { bg = c.gutter.fg },
    IlluminatedWordWrite = { bg = c.gutter.fg },
    illuminatedCurWord = { bg = c.gutter.fg },
    illuminatedWord = { bg = c.gutter.fg },
  }
end

return M
