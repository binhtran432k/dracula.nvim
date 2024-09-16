local config = require("dracula.config")
local util = require("dracula.util")

local M = {}

---@type table<string, string>
M.plugins = {
  ["aerial.nvim"] = "aerial",
  ["ale"] = "ale",
  ["alpha-nvim"] = "alpha",
  ["barbar.nvim"] = "barbar",
  ["bufferline.nvim"] = "bufferline",
  ["dashboard-nvim"] = "dashboard",
  ["flash.nvim"] = "flash",
  ["fzf-lua"] = "fzf",
  ["gitsigns.nvim"] = "gitsigns",
  ["grug-far.nvim"] = "grug-far",
  ["headlines.nvim"] = "headlines",
  ["hop.nvim"] = "hop",
  ["indent-blankline.nvim"] = "indent-blankline",
  ["indentmini.nvim"] = "indentmini",
  ["lazy.nvim"] = "lazy",
  ["leap.nvim"] = "leap",
  ["lspsaga.nvim"] = "lspsaga",
  ["mason.nvim"] = "mason",
  ["mini.animate"] = "mini_animate",
  ["mini.clue"] = "mini_clue",
  ["mini.completion"] = "mini_completion",
  ["mini.cursorword"] = "mini_cursorword",
  ["mini.deps"] = "mini_deps",
  ["mini.diff"] = "mini_diff",
  ["mini.files"] = "mini_files",
  ["mini.hipatterns"] = "mini_hipatterns",
  ["mini.icons"] = "mini_icons",
  ["mini.indentscope"] = "mini_indentscope",
  ["mini.jump"] = "mini_jump",
  ["mini.map"] = "mini_map",
  ["mini.notify"] = "mini_notify",
  ["mini.operators"] = "mini_operators",
  ["mini.pick"] = "mini_pick",
  ["mini.starter"] = "mini_starter",
  ["mini.statusline"] = "mini_statusline",
  ["mini.surround"] = "mini_surround",
  ["mini.tabline"] = "mini_tabline",
  ["mini.test"] = "mini_test",
  ["mini.trailspace"] = "mini_trailspace",
  ["neo-tree.nvim"] = "neo-tree",
  ["neogit"] = "neogit",
  ["neotest"] = "neotest",
  ["noice.nvim"] = "noice",
  ["nvim-cmp"] = "cmp",
  ["nvim-dap"] = "dap",
  ["nvim-navic"] = "navic",
  ["nvim-notify"] = "notify",
  ["nvim-scrollbar"] = "scrollbar",
  ["nvim-tree.lua"] = "nvim-tree",
  ["nvim-treesitter-context"] = "treesitter-context",
  ["octo.nvim"] = "octo",
  ["rainbow-delimiters.nvim"] = "rainbow",
  ["render-markdown.nvim"] = "markdown",
  ["telescope.nvim"] = "telescope",
  ["trouble.nvim"] = "trouble",
  ["vim-gitgutter"] = "gitgutter",
  ["vim-glyph-palette"] = "glyph-palette",
  ["vim-illuminate"] = "illuminate",
  ["vim-sneak"] = "sneak",
  ["vimwiki"] = "vimwiki",
  ["which-key.nvim"] = "which-key",
  ["yanky.nvim"] = "yanky",
}

---@param name string
---@return {get: DraculaHighlightsFn, url: string}
function M.get_group(name)
  return util.mod("dracula.groups." .. name)
end

---@param name string
---@param colors DraculaColorScheme
---@param opts DraculaConfig
function M.get(name, colors, opts)
  local mod = M.get_group(name)
  return mod.get(colors, opts)
end

---@param colors DraculaColorScheme
---@param opts DraculaConfig
function M.setup(colors, opts)
  local groups = {
    base = true,
    kinds = true,
    semantic_tokens = true,
    treesitter = true,
  }

  if opts.plugins.all then
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif opts.plugins.auto and package.loaded.lazy then
    local plugins = require("lazy.core.config").plugins
    for plugin, group in pairs(M.plugins) do
      if plugins[plugin] then
        groups[group] = true
      end
    end

    -- special case for mini.nvim
    if plugins["mini.nvim"] then
      for _, group in pairs(M.plugins) do
        if string.find(group, "^mini_") then
          groups[group] = true
        end
      end
    end
  end

  -- manually enable/disable plugins
  for plugin, group in pairs(M.plugins) do
    local use = opts.plugins[group]
    use = use == nil and opts.plugins[plugin] or use
    if use ~= nil then
      if type(use) == "table" then
        use = use.enabled
      end
      groups[group] = use or nil
    end
  end

  local names = vim.tbl_keys(groups)
  table.sort(names)

  ---@type string
  local cache_key = util.get_style_name(opts)
  local cache = opts.cache and util.cache.read(cache_key)

  local inputs = {
    colors = colors,
    plugins = names,
    version = config.version,
    opts = {
      transparent = opts.transparent,
      styles = opts.styles,
      dim_inactive = opts.dim_inactive,
    },
  }

  ---@type DraculaHighlights|false|nil
  local ret = cache and vim.deep_equal(inputs, cache.inputs) and cache.groups

  if not ret then
    ret = {}
    -- merge highlights
    for group in pairs(groups) do
      for k, v in pairs(M.get(group, colors, opts)) do
        ret[k] = v
      end
    end
    util.resolve(ret)
    if opts.cache then
      util.cache.write(cache_key, { groups = ret, inputs = inputs })
    end
  end

  opts.on_highlights(ret --[[@as DraculaHighlights]], colors)

  return ret, groups
end

return M
