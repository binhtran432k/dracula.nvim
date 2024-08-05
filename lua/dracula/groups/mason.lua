local util = require("dracula.util")

local M = {}

M.url = "https://github.com/williamboman/mason.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    MasonHeader = { bg = c.border_header, fg = c.black },
    MasonHighlight = { fg = c.purple },
    MasonHighlightBlock = { bg = c.purple, fg = c.black },
    MasonHighlightBlockBold = { bg = c.purple, fg = c.black, bold = true },
    MasonMutedBlock = { bg = c.line },
    MasonMutedBlockBold = { bg = c.line, bold = true },
    MasonHeaderSecondary = { bg = c.purple, fg = c.black, bold = true },
    MasonHighlightSecondary = { fg = c.border_header },
    MasonHighlightBlockSecondary = { bg = c.border_header, fg = c.black },
    MasonHighlightBlockBoldSecondary = { bg = c.border_header, fg = c.black, bold = true },
  }
end

return M
