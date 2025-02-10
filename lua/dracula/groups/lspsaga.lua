local M = {}

M.url = "https://github.com/glepnir/lspsaga.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    DefinitionCount = { fg = c.pink },
    DefinitionIcon = { fg = c.purple },
    DiagnosticInformation = "DiagnosticInfo",
    DiagnosticWarning = "DiagnosticWarn",
    LspFloatWinBorder = { fg = c.border },
    LspFloatWinNormal = { bg = c.float_bg },
    LspSagaBorderTitle = { fg = c.pink },
    LspSagaCodeActionBorder = { fg = c.border },
    LspSagaCodeActionContent = { fg = c.pink },
    LspSagaCodeActionTitle = { fg = c.purple },
    LspSagaDefPreviewBorder = { fg = c.green },
    LspSagaFinderSelection = { fg = c.visual },
    LspSagaHoverBorder = { fg = c.border },
    LspSagaRenameBorder = { fg = c.green },
    LspSagaSignatureHelpBorder = { fg = c.red },
    ReferencesCount = { fg = c.pink },
    ReferencesIcon = { fg = c.purple },
    TargetWord = { fg = c.cyan },
  }
end

return M
