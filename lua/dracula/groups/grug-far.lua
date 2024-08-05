local M = {}

M.url = "https://github.com/MagicDuck/grug-far.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    GrugFarHelpHeader             = { fg = c.comment },
    GrugFarHelpHeaderKey          = { fg = c.cyan },
    GrugFarInputLabel             = { fg = c.purple },
    GrugFarInputPlaceholder       = { fg = c.line },
    GrugFarResultsChangeIndicator = { fg = c.git.change },
    GrugFarResultsHeader          = { fg = c.orange },
    GrugFarResultsLineColumn      = { fg = c.line },
    GrugFarResultsLineNo          = { fg = c.line },
    GrugFarResultsMatch           = { fg = c.black, bg = c.red },
    GrugFarResultsStats           = { fg = c.purple },
  }
end

return M
