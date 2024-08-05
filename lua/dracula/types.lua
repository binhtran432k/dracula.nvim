---@class DraculaPurePalette
---@field bg string
---@field selection string
---@field fg string
---@field comment string
---@field cyan string
---@field green string
---@field orange string
---@field pink string
---@field purple string
---@field red string
---@field yellow string
---@field black string
---@field white string
---@field bright_red string
---@field bright_green string
---@field bright_yellow string
---@field bright_blue string
---@field bright_magenta string
---@field bright_cyan string
---@field bright_white string

---@class DraculaPalette: DraculaPurePalette
---@field teal string
---@field git { add: string, delete: string, change: string, ignore: string }
---@field gitSigns { add: string, delete: string, change: string }
---@field diff { add: string, delete: string, change: string, text: string }
---@field error string
---@field warning string
---@field todo string
---@field info string
---@field hint string
---@field inactive string
---@field line string
---@field border string
---@field border_header string
---@field visual string
---@field search string
---@field search_alt string
---@field statusline string
---@field none string
---@field dark { fg: string, bg: string }
---@field gutter { fg: string, bg: string }
---@field popup { fg: string, bg: string }
---@field sidebar { fg: string, bg: string }
---@field float { fg: string, bg: string }

---@class DraculaHighlight: vim.api.keyset.highlight
---@field style? string | DraculaHighlight

---@class DraculaHighlights
---@field sidebars? DraculaBackgroundStyle
---@field floats? DraculaBackgroundStyle
---@field [...] DraculaHighlight | string

---@alias DraculaStyle "default" | "day" | "soft"

---@alias DraculaBackgroundStyle "dark" | "transparent" | "normal"

---@alias DraculaHighlightsFn fun(colors: DraculaColorScheme, opts: DraculaConfig): DraculaHighlights

---@class DraculaCache
---@field groups DraculaHighlights
---@field inputs table
