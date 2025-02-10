local M = {}

M.url = "https://github.com/RRethy/vim-illuminate"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    IlluminatedWordRead = { bg = c.gutter_fg },
    IlluminatedWordText = { bg = c.gutter_fg },
    IlluminatedWordWrite = { bg = c.gutter_fg },
    illuminatedCurWord = { bg = c.gutter_fg },
    illuminatedWord = { bg = c.gutter_fg },
  }
end

return M
