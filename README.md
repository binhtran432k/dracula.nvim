# 🧛 Dracula

A dark and light [Neovim](https://github.com/neovim/neovim) theme written in
[Lua](https://www.lua.org) ported from the [Visual Studio Code
Dracula](https://github.com/dracula/visual-studio-code) theme.

## Default

![image](https://github.com/user-attachments/assets/0da1156b-daf7-45a0-9188-c46800378d49)

## Soft

![image](https://github.com/user-attachments/assets/432f1892-026e-4d5a-80b3-31867da7ef3e)

## Day

![image](https://github.com/user-attachments/assets/bf04b8ae-0b82-4b93-9f8e-5287b17dde98)

## ✨ Features

- Supports the latest [Neovim](https://github.com/neovim/neovim)
  [0.10.0](https://github.com/neovim/neovim/releases/tag/v0.10.0) features.
- Enhances terminal colors.
- Introduces a darker background option for sidebar-like windows.
- Supports all major plugins.

## ⚡️ Requirements

- [Neovim](https://github.com/neovim/neovim) >=
  [0.10.0](https://github.com/neovim/neovim/releases/tag/v0.10.0)

## 📦 Installation

Install the theme with your preferred package manager, such as
[folke/lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "binhtran432k/dracula.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

## 🚀 Usage

### Vim Script

```vim
colorscheme dracula

" There are also colorschemes for the different styles.
colorscheme dracula-soft
colorscheme dracula-day
```

### [Lua](https://www.lua.org)

```lua
vim.cmd[[colorscheme dracula]]
```

#### External Plugins

##### [Barbecue](https://github.com/utilyre/barbecue.nvim)

```lua
-- Lua
require('barbecue').setup {
  -- ... your barbecue config
  theme = 'dracula',
  -- ... your barbecue config
}
```

##### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

```lua
-- Lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'dracula'
    -- ... your lualine config
  }
}
```

##### [Lightline](https://github.com/itchyny/lightline.vim)

```vim
" Vim Script
let g:lightline = {'colorscheme': 'dracula'}
```

## ⚙️ Configuration

> ❗️ Set the configuration **BEFORE** loading the color scheme with `colorscheme dracula`.

The theme offers four styles: [default](#default), [soft](#soft)
and [day](#day).

The [day](#day) style is used when `{ style = "day" }` is passed to
`setup(options)` or when `vim.o.background = "light"`.

[Dracula](https://github.com/binhtran432k/dracula.nvim) uses the default options,
unless `setup` is explicitly called.

```lua
require("dracula").setup({
  style = "default", -- The theme comes in three styles, `default`, a darker variant `soft` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_colors = function() end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  on_highlights = function() end,
  use_background = true, -- can be light/dark/auto. When auto, background will be set to vim.o.background

  cache = true, -- When set to true, the theme will be cached for better performance

  prefer_undercurl = true, -- When set to true, the undercurl will be used place of underline in specific contexts.

  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses your plugin manager to automatically enable needed plugins
    -- currently only lazy.nvim is supported
    auto = true,
    -- add any plugins here that you want to enable
    -- for all possible plugins, see:
    --   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
    -- telescope = true,
  },
})
```

## 🪓 Overriding Colors & Highlight Groups

How the highlight groups are calculated:

1. `colors` are determined based on your configuration, with the ability to
   override them using `config.on_colors(colors)`.
1. These `colors` are utilized to generate the highlight groups.
1. `config.on_highlights(highlights, colors)` can be used to override highlight
   groups.

### Settings and color alteration demonstration

```lua
require("dracula").setup({
  -- use the night style
  style = "soft",
  -- disable italic for functions
  styles = {
    functions = {}
  },
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end
})
```

### [Borderless Telescope](https://github.com/nvim-telescope/telescope.nvim/wiki/Gallery#borderless) example

```lua
require("dracula").setup({
  on_highlights = function(hl, c)
    local prompt = c.dark.bg
    hl.TelescopeNormal = {
      bg = c.bg,
      fg = c.fg,
    }
    hl.TelescopeBorder = {
      bg = c.bg,
      fg = c.bg,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg,
      fg = c.bg,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg,
      fg = c.bg,
    }
  end,
})
```

### Fix `undercurls` in [Tmux](https://github.com/tmux/tmux)

To have undercurls show up and in color, add the following to your
[Tmux](https://github.com/tmux/tmux) configuration file:

```sh
# Undercurl
set -g default-terminal "${TERM}"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

## 🔥 Contributing

Pull requests are welcome.

## 🤝 Inspirations

- Tokyonight: https://github.com/folke/tokyonight.nvim
- Dracula: https://github.com/Mofiqul/dracula.nvim
