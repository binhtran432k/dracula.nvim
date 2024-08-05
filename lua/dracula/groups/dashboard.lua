local M = {}

M.url = "https://github.com/nvimdev/dashboard-nvim"

---@type DraculaHighlightsFn
function M.get(c)
  return {
    -- General
    DashboardHeader = { fg = c.pink },
    DashboardFooter = { fg = c.purple },
    DashboardCenter = { fg = c.pink },
    -- Hyper theme
    DashboardProjectTitle = { fg = c.cyan },
    DashboardProjectTitleIcon = { fg = c.orange },
    DashboardProjectIcon = { fg = c.yellow },
    DashboardMruTitle = { fg = c.cyan },
    DashboardMruIcon = { fg = c.purple },
    DashboardFiles = { fg = c.purple },
    DashboardShortCutIcon = { fg = c.pink },
    -- Doome theme
    DashboardDesc = { fg = c.cyan },
    DashboardKey = { fg = c.orange },
    DashboardIcon = { fg = c.pink, bold = true },
    DashboardShortCut = { fg = c.cyan },

  }
end

return M
