local M = {}

M.url = "https://github.com/isakbm/gitgraph.nvim"

---@type DraculaHighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    GitGraphHash       = { fg = c.purple },
    GitGraphTimestamp  = { fg = c.yellow },
    GitGraphAuthor     = { fg = c.pink },
    GitGraphBranchName = { fg = c.cyan },
    GitGraphBranchTag  = { fg = c.green },
    GitGraphBranchMsg  = { fg = c.comment },
    GitGraphBranch1    = { fg = c.pink },
    GitGraphBranch2    = { fg = c.green },
    GitGraphBranch3    = { fg = c.red },
    GitGraphBranch4    = { fg = c.yellow },
    GitGraphBranch5    = { fg = c.cyan },
  }
end

return M
