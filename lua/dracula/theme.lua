local util = require("dracula.util")
local colors = require("dracula.colors")

local M = {}
--
---@class Highlight
---@field fg string|nil
---@field bg string|nil
---@field sp string|nil
---@field style string|nil|Highlight
---@field link string|nil

---@alias Highlights table<string,Highlight>

---@return Theme
function M.setup()
  local config = require("dracula.config")
  local options = config.options
  ---@class Theme
  ---@field highlights Highlights
  local theme = {
    config = options,
    colors = colors.setup(),
  }

  local c = theme.colors

  local function make_alpha(color, alpha)
    return util.blend(color, c.bg, alpha)
  end

  theme.highlights = {
    Foo = { bg = c.pink, fg = c.fg },

    Comment = { fg = c.comment, style = options.styles.comments }, -- any comment
    ColorColumn = { bg = c.black }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.comment }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.line_hl }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.line_hl }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.purple }, -- directory names (and other special names in listings)
    DiffAdd = { bg = make_alpha(c.green, 0.2) }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = make_alpha(c.purple, 0.4) }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = make_alpha(c.red, 0.5) }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.comment }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.bright_red }, -- error messages on the command line
    VertSplit = { fg = c.darker_bg }, -- the column separating vertically split windows
    WinSeparator = { fg = c.darker_bg, bold = true }, -- the column separating vertically split windows
    Folded = { fg = c.purple, bg = c.light_bg }, -- line used for closed folds
    FoldColumn = { bg = options.transparent and c.none or c.bg, fg = c.comment }, -- 'foldcolumn'
    SignColumn = { bg = options.transparent and c.none or c.bg }, -- column where |signs| are displayed
    SignColumnSB = { bg = options.transparent and c.none or c.dark_bg, fg = c.dark_fg }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.comment }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.fg, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.orange, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.dark_fg, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.dark_fg }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.bright_green }, -- |more-prompt|
    NonText = { fg = c.none_text }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = options.transparent and c.none or options.dim_inactive and c.dark_bg or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.dark_fg, bg = c.darker_bg }, -- normal text in sidebar
    NormalFloat = { fg = c.dark_fg, bg = c.dark_bg }, -- Normal text in floating windows.
    FloatBorder = { fg = c.border_hl, bg = c.dark_bg },
    FloatTitle = { fg = c.pink, bg = c.dark_bg },
    Pmenu = { bg = c.dark_bg, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = c.selection }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.blend(c.dark_bg, c.fg, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.dark_fg }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.purple }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.visual_bg, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = make_alpha(c.purple, 0.8), fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.orange, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { link = "IncSearch" },
    SpecialKey = { fg = c.none_text }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.bright_red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.yellow, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.cyan, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.teal, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.dark_fg, bg = c.darker_bg }, -- status line of current window
    StatusLineNC = { fg = c.comment, bg = c.darker_bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.dark_bg, fg = c.comment }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.dark_bg }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.dark_bg, bg = c.purple }, -- tab pages line, active tab page label
    Title = { fg = c.purple, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.visual_bg }, -- Visual mode selection
    VisualNOS = { bg = c.visual_bg }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.yellow }, -- warning messages
    Whitespace = { fg = c.none_text }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.visual_bg }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.purple }, -- (preferred) any constant
    String = { fg = c.yellow }, --   a string constant: "this is a string"
    Character = { fg = c.green }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    -- Boolean       = { }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.cyan, style = options.styles.variables }, -- (preferred) any variable name
    Function = { fg = c.green, style = options.styles.functions }, -- function name (also: methods for classes)

    Statement = { fg = c.pink, style = options.styles.statement }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.pink }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.pink, style = options.styles.keywords }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.pink, style = options.styles.preprocessor }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.cyan }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = c.green, italic = true }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    Debug = { fg = c.orange }, --    debugging statements

    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true },
    Italic = { italic = true },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.red }, -- (preferred) any erroneous construct
    Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = c.comment },
    qfFileName = { fg = c.purple },

    htmlH1 = { fg = c.pink, bold = true },
    htmlH2 = { fg = c.purple, bold = true },

    -- mkdHeading = { fg = c.orange, bold = true },
    -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = c.dark_bg, fg = c.fg },
    mkdCodeStart = { fg = c.teal, bold = true },
    mkdCodeEnd = { fg = c.teal, bold = true },
    -- mkdLink = { fg = c.blue, underline = true },

    markdownHeadingDelimiter = { fg = c.orange, bold = true },
    markdownCode = { fg = c.teal },
    markdownCodeBlock = { fg = c.teal },
    markdownH1 = { fg = c.pink, bold = true },
    markdownH2 = { fg = c.purple, bold = true },
    markdownLinkText = { fg = c.purple, underline = true },

    ["helpCommand"] = { bg = c.light_bg, fg = c.purple },

    debugPC = { bg = c.darker_bg }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = make_alpha(c.cyan, 0.1), fg = c.cyan }, -- used for breakpoint colors in terminal-debug

    dosIniLabel = { link = "@property" },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.lighter_bg }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.lighter_bg }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.lighter_bg }, -- used for highlighting "write" references

    DiagnosticError = { fg = c.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.cyan }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.teal }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = c.comment }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { bg = make_alpha(c.red, 0.1), fg = c.red }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = make_alpha(c.yellow, 0.1), fg = c.yellow }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = make_alpha(c.cyan, 0.1), fg = c.cyan }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = make_alpha(c.teal, 0.1), fg = c.teal }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { undercurl = true, sp = c.red }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.cyan }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = c.teal }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { bg = make_alpha(c.visual_bg, 0.4), bold = true },
    LspCodeLens = { fg = c.comment },
    LspInlayHint = { bg = make_alpha(c.purple, 0.1), fg = c.none_text },

    LspInfoBorder = { fg = c.border_hl, bg = c.dark_bg },

    ALEErrorSign = { fg = c.red },
    ALEWarningSign = { fg = c.yellow },

    DapStoppedLine = { bg = make_alpha(c.yellow, 0.1) }, -- Used for "Warning" diagnostic virtual text

    -- These groups are for the Neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.

    --- Misc
    -- TODO:
    -- ["@comment.documentation"] = { },
    ["@operator"] = { fg = c.pink }, -- For any operator: `+`, but also `->` and `*` in C.

    --- Punctuation
    ["@punctuation.delimiter"] = { fg = c.fg }, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = { fg = c.dark_fg }, -- For brackets and parens.
    ["@punctuation.special"] = { fg = c.cyan }, -- For special punctutation that does not fall in the catagories before.
    ["@punctuation.special.markdown"] = { fg = c.purple, bold = true },

    --- Literals
    ["@string.documentation"] = { fg = c.yellow },
    ["@string.regex"] = { fg = c.red }, -- For regexes.
    ["@string.escape"] = { fg = c.cyan }, -- For escape characters within a string.

    --- Functions
    ["@constructor"] = { fg = c.cyan }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@parameter"] = { fg = c.orange }, -- For parameters of a function.
    ["@parameter.builtin"] = { fg = util.blend(c.orange, c.fg, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    --- Keywords
    ["@keyword"] = { fg = c.pink, style = options.styles.keywords }, -- For keywords that don't fall in previous categories.
    -- TODO:
    -- ["@keyword.coroutine"] = { }, -- For keywords related to coroutines.
    ["@keyword.function"] = { fg = c.cyan, style = options.styles.functions }, -- For keywords used to define a fuction.
    ["@keyword.function.ruby"] = { fg = c.pink, style = options.styles.functions }, -- For keywords used to define a fuction.

    ["@label"] = { fg = c.cyan }, -- For labels: `label:` in C and `:label:` in Lua.

    --- Types
    ["@type.builtin"] = { fg = c.cyan, italic = true },
    ["@field"] = { fg = c.bright_green }, -- For fields.
    ["@property"] = { fg = c.bright_green },

    --- Identifiers
    ["@variable"] = { fg = c.fg, style = options.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = c.purple, italic = true }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@namespace.builtin"] = { fg = c.orange, italic = true }, -- Variable names that are defined by the languages, like `this` or `self`.

    --- Text
    -- ["@text.literal.markdown"] = { fg = c.purple },
    ["@text.literal.markdown_inline"] = { bg = c.light_bg, fg = c.purple },
    ["@text.reference"] = { fg = c.orange, bold = true },

    ["@text.todo.unchecked"] = { fg = c.cyan }, -- For brackets and parens.
    ["@text.todo.checked"] = { fg = c.green }, -- For brackets and parens.
    ["@text.warning"] = { fg = c.bg, bg = c.yellow },
    ["@text.danger"] = { fg = c.bg, bg = c.red },

    ["@text.diff.add"] = { link = "DiffAdd" },
    ["@text.diff.delete"] = { link = "DiffDelete" },

    ["@namespace"] = { link = "Include" },

    -- tsx
    ["@tag.tsx"] = { fg = c.red },
    ["@constructor.tsx"] = { fg = c.purple },
    ["@tag.delimiter.tsx"] = { fg = make_alpha(c.teal, 0.7) },

    -- LSP Semantic Token Groups
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.deriveHelper"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.generic"] = { link = "@variable" },
    ["@lsp.type.interface"] = { fg = make_alpha(c.cyan, 0.7) },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.lifetime"] = { link = "@storageclass" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.red },
    ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = make_alpha(c.teal, 0.8) },
    ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = make_alpha(c.teal, 0.8) },
    ["@lsp.typemod.variable.callable"] = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@lsp.typemod.variable.static"] = { link = "@constant" },
    -- NOTE: maybe add these with distinct highlights?
    -- ["@lsp.typemod.variable.globalScope"] (global variables)

    -- ts-rainbow
    rainbowcol1 = { fg = c.red },
    rainbowcol2 = { fg = c.orange },
    rainbowcol3 = { fg = c.yellow },
    rainbowcol4 = { fg = c.green },
    rainbowcol5 = { fg = c.purple },
    rainbowcol6 = { fg = c.pink },
    rainbowcol7 = { fg = c.cyan },

    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = c.red },
    TSRainbowOrange = { fg = c.orange },
    TSRainbowYellow = { fg = c.yellow },
    TSRainbowGreen = { fg = c.green },
    TSRainbowBlue = { fg = c.purple },
    TSRainbowViolet = { fg = c.pink },
    TSRainbowCyan = { fg = c.cyan },

    -- rainbow-delimiters
    RainbowDelimiterRed = { fg = c.red },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterGreen = { fg = c.green },
    RainbowDelimiterBlue = { fg = c.purple },
    RainbowDelimiterViolet = { fg = c.pink },
    RainbowDelimiterCyan = { fg = c.cyan },

    -- LspTrouble
    TroubleText = { fg = c.dark_fg },
    TroubleCount = { fg = c.pink, bg = c.darker_bg },
    TroubleNormal = { fg = c.dark_fg, bg = c.darker_bg },

    -- Illuminate
    illuminatedWord = { bg = c.selection },
    illuminatedCurWord = { bg = c.visual_bg },
    IlluminatedWordText = { bg = c.selection },
    IlluminatedWordRead = { bg = c.selection },
    IlluminatedWordWrite = { bg = c.selection },

    -- diff
    diffAdded = { fg = c.green },
    diffRemoved = { fg = c.red },
    diffChanged = { fg = c.cyan },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.purple },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.pink },

    -- Neogit
    NeogitBranch = { fg = c.pink },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.light_bg, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.light_bg, fg = c.purple },
    NeogitDiffContextHighlight = { bg = make_alpha(c.light_bg, 0.5), fg = c.dark_fg },
    NeogitDiffDeleteHighlight = { fg = c.red, bg = make_alpha(c.red, 0.1) },
    NeogitDiffAddHighlight = { fg = c.green, bg = make_alpha(c.green, 0.1) },

    -- Neotest
    NeotestPassed = { fg = c.green },
    NeotestRunning = { fg = c.yellow },
    NeotestFailed = { fg = c.red },
    NeotestSkipped = { fg = c.cyan },
    NeotestTest = { fg = c.dark_fg },
    NeotestNamespace = { fg = c.bright_green },
    NeotestFocused = { fg = c.yellow },
    NeotestFile = { fg = c.teal },
    NeotestDir = { fg = c.purple },
    NeotestBorder = { fg = c.border_hl },
    NeotestIndent = { fg = c.dark_fg },
    NeotestExpandMarker = { fg = c.dark_fg },
    NeotestAdapterName = { fg = c.purple, bold = true },
    NeotestWinSelect = { fg = c.purple },
    NeotestMarked = { fg = c.purple },
    NeotestTarget = { fg = c.purple },
    --[[ NeotestUnknown = {}, ]]

    -- GitGutter
    GitGutterAdd = { fg = c.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.delete }, -- diff mode: Deleted line |diff.txt|
    GitGutterAddLineNr = { fg = c.add },
    GitGutterChangeLineNr = { fg = c.change },
    GitGutterDeleteLineNr = { fg = c.delete },

    -- GitSigns
    GitSignsAdd = { fg = c.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.delete }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeTitle = { fg = c.pink, bg = c.dark_bg },
    TelescopeBorder = { fg = c.border_hl, bg = c.dark_bg },
    TelescopeNormal = { fg = c.fg, bg = c.dark_bg },

    -- NvimTree
    NvimTreeNormal = { fg = c.dark_fg, bg = c.darker_bg },
    NvimTreeWinSeparator = {
      fg = options.styles.sidebars == "transparent" and c.border_hl or c.darker_bg,
      bg = c.darker_bg,
    },
    NvimTreeNormalNC = { fg = c.dark_fg, bg = c.darker_bg },
    NvimTreeRootFolder = { fg = c.purple, bold = true },
    NvimTreeGitDirty = { fg = c.change },
    NvimTreeGitNew = { fg = c.add },
    NvimTreeGitDeleted = { fg = c.delete },
    NvimTreeOpenedFile = { bg = c.light_bg },
    NvimTreeSpecialFile = { fg = c.purple, underline = true },
    NvimTreeIndentMarker = { fg = c.dark_fg },
    NvimTreeImageFile = { fg = c.dark_fg },
    NvimTreeSymlink = { fg = c.teal },
    NvimTreeFolderIcon = { bg = c.none, fg = c.purple },
    -- NvimTreeFolderName= { fg = c.dark_fg },

    NeoTreeNormal = { fg = c.fg, bg = c.darker_bg },
    NeoTreeNormalNC = { fg = c.fg, bg = c.darker_bg },
    NeoTreeDimText = { fg = c.dark_fg },

    -- Fern
    FernBranchText = { fg = c.purple },

    -- glyph palette
    GlyphPalette1 = { fg = c.red },
    GlyphPalette2 = { fg = c.green },
    GlyphPalette3 = { fg = c.yellow },
    GlyphPalette4 = { fg = c.purple },
    GlyphPalette6 = { fg = c.teal },
    GlyphPalette7 = { fg = c.fg },
    GlyphPalette9 = { fg = c.orange },

    -- Dashboard
    DashboardShortCut = { fg = c.cyan },
    DashboardHeader = { fg = c.pink },
    DashboardCenter = { fg = c.pink },
    DashboardFooter = { fg = c.purple },
    DashboardKey = { fg = c.orange },
    DashboardDesc = { fg = c.cyan },
    DashboardIcon = { fg = c.pink, bold = true },

    -- Alpha
    AlphaShortcut = { fg = c.orange },
    AlphaHeader = { fg = c.pink },
    AlphaHeaderLabel = { fg = c.orange },
    AlphaFooter = { fg = c.purple },
    AlphaButtons = { fg = c.cyan },

    -- WhichKey
    WhichKey = { fg = c.cyan },
    WhichKeyGroup = { fg = c.purple },
    WhichKeyDesc = { fg = c.pink },
    WhichKeySeperator = { fg = c.comment },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyFloat = { bg = c.darker_bg },
    WhichKeyValue = { fg = c.darker_fg },

    -- LspSaga
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },

    LspFloatWinNormal = { bg = c.dark_bg },
    LspFloatWinBorder = { fg = c.border_hl },
    LspSagaBorderTitle = { fg = c.pink },
    LspSagaHoverBorder = { fg = c.purple },
    LspSagaRenameBorder = { fg = c.green },
    LspSagaDefPreviewBorder = { fg = c.green },
    LspSagaCodeActionBorder = { fg = c.purple },
    LspSagaFinderSelection = { fg = c.visual_bg },
    LspSagaCodeActionTitle = { fg = c.purple },
    LspSagaCodeActionContent = { fg = c.pink },
    LspSagaSignatureHelpBorder = { fg = c.red },
    ReferencesCount = { fg = c.pink },
    DefinitionCount = { fg = c.pink },
    DefinitionIcon = { fg = c.purple },
    ReferencesIcon = { fg = c.purple },
    TargetWord = { fg = c.cyan },

    -- NeoVim
    healthError = { fg = c.red },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.yellow },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.purple },

    -- Barbar
    BufferCurrent = { bg = c.bg, fg = c.fg },
    BufferCurrentERROR = { bg = c.bg, fg = c.red },
    BufferCurrentHINT = { bg = c.bg, fg = c.teal },
    -- BufferCurrentIcon = { bg = c.bg, fg = c.},
    BufferCurrentINFO = { bg = c.bg, fg = c.cyan },
    BufferCurrentWARN = { bg = c.bg, fg = c.yellow },
    BufferCurrentIndex = { bg = c.bg, fg = c.cyan },
    BufferCurrentMod = { bg = c.bg, fg = c.yellow },
    BufferCurrentSign = { bg = c.bg, fg = c.bg },
    BufferCurrentTarget = { bg = c.bg, fg = c.red },
    BufferAlternate = { bg = c.lighter_bg, fg = c.fg },
    BufferAlternateERROR = { bg = c.lighter_bg, fg = c.red },
    BufferAlternateHINT = { bg = c.lighter_bg, fg = c.cyan },
    -- BufferAlternateIcon = { bg = c.fg_gutter, fg = c. },
    BufferAlternateIndex = { bg = c.lighter_bg, fg = c.cyan },
    BufferAlternateINFO = { bg = c.lighter_bg, fg = c.cyan },
    BufferAlternateMod = { bg = c.lighter_bg, fg = c.yellow },
    BufferAlternateSign = { bg = c.lighter_bg, fg = c.cyan },
    BufferAlternateTarget = { bg = c.lighter_bg, fg = c.red },
    BufferAlternateWARN = { bg = c.lighter_bg, fg = c.yellow },
    BufferVisible = { bg = c.darker_bg, fg = c.fg },
    BufferVisibleERROR = { bg = c.darker_bg, fg = c.red },
    BufferVisibleHINT = { bg = c.darker_bg, fg = c.teal },
    -- BufferVisibleIcon = { bg = c.bg_statusline, fg = c. },
    BufferVisibleINFO = { bg = c.darker_bg, fg = c.cyan },
    BufferVisibleWARN = { bg = c.darker_bg, fg = c.yellow },
    BufferVisibleIndex = { bg = c.darker_bg, fg = c.cyan },
    BufferVisibleMod = { bg = c.darker_bg, fg = c.yellow },
    BufferVisibleSign = { bg = c.darker_bg, fg = c.cyan },
    BufferVisibleTarget = { bg = c.darker_bg, fg = c.red },
    BufferInactive = { bg = make_alpha(c.light_bg, 0.4), fg = make_alpha(c.none_text, 0.8) },
    BufferInactiveERROR = { bg = make_alpha(c.light_bg, 0.4), fg = make_alpha(c.red, 0.8) },
    BufferInactiveHINT = { bg = make_alpha(c.light_bg, 0.4), fg = make_alpha(c.teal, 0.8) },
    -- BufferInactiveIcon = { bg = c.darker_bg, fg = make_alpha(c., 0.1) },
    BufferInactiveINFO = { bg = make_alpha(c.light_bg, 0.4), fg = make_alpha(c.cyan, 0.8) },
    BufferInactiveWARN = { bg = make_alpha(c.light_bg, 0.4), fg = make_alpha(c.yellow, 0.8) },
    BufferInactiveIndex = { bg = make_alpha(c.light_bg, 0.4), fg = c.none_text },
    BufferInactiveMod = { bg = make_alpha(c.light_bg, 0.4), fg = make_alpha(c.yellow, 0.8) },
    BufferInactiveSign = { bg = make_alpha(c.light_bg, 0.4), fg = c.bg },
    BufferInactiveTarget = { bg = make_alpha(c.light_bg, 0.4), fg = c.red },
    BufferOffset = { bg = c.darker_bg, fg = c.none_text },
    BufferTabpageFill = { bg = make_alpha(c.light_bg, 0.8), fg = c.none_text },
    BufferTabpages = { bg = c.darker_bg, fg = c.none },

    -- Sneak
    Sneak = { fg = c.light_bg, bg = c.pink },
    SneakScope = { bg = c.visual_bg },

    -- Hop
    HopNextKey = { fg = c.pink, bold = true },
    HopNextKey1 = { fg = c.purple, bold = true },
    HopNextKey2 = { fg = make_alpha(c.purple, 0.6) },
    HopUnmatched = { fg = c.darker_fg },

    TSNodeKey = { fg = c.pink, bold = true },
    TSNodeUnmatched = { fg = c.darker_fg },

    LeapMatch = { bg = c.pink, fg = c.fg, bold = true },
    LeapLabelPrimary = { fg = c.pink, bold = true },
    LeapLabelSecondary = { fg = c.green, bold = true },
    LeapBackdrop = { fg = c.darker_fg },

    FlashBackdrop = { fg = c.darker_fg },
    FlashLabel = { bg = c.pink, bold = true, fg = c.fg },

    LightspeedGreyWash = { fg = c.selection },
    -- LightspeedCursor = { link = "Cursor" },
    LightspeedLabel = { fg = c.pink, bold = true, underline = true },
    LightspeedLabelDistant = { fg = c.green, bold = true, underline = true },
    LightspeedLabelDistantOverlapped = { fg = c.green, underline = true },
    LightspeedLabelOverlapped = { fg = c.pink, underline = true },
    LightspeedMaskedChar = { fg = c.orange },
    LightspeedOneCharMatch = { bg = c.pink, fg = c.fg, bold = true },
    LightspeedPendingOpArea = { bg = c.pink, fg = c.fg },
    LightspeedShortcut = { bg = c.pink, fg = c.fg, bold = true, underline = true },
    -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
    -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
    LightspeedUnlabeledMatch = { fg = c.purple, bold = true },

    -- Cmp
    CmpDocumentation = { fg = c.fg, bg = c.dark_bg },
    CmpDocumentationBorder = { fg = c.border_hl, bg = c.dark_bg },
    CmpGhostText = { fg = c.darker_fg },

    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.darker_fg, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.cyan, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, bg = c.none },

    CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindDefault = { fg = c.dark_fg, bg = c.none },

    CmpItemKindKeyword = { fg = c.cyan, bg = c.none },

    CmpItemKindVariable = { fg = c.pink, bg = c.none },
    CmpItemKindConstant = { fg = c.pink, bg = c.none },
    CmpItemKindReference = { fg = c.pink, bg = c.none },
    CmpItemKindValue = { fg = c.pink, bg = c.none },
    CmpItemKindCopilot = { fg = c.teal, bg = c.none },
    CmpItemKindCodeium = { fg = c.teal, bg = c.none },
    CmpItemKindTabNine = { fg = c.teal, bg = c.none },

    CmpItemKindFunction = { fg = c.purple, bg = c.none },
    CmpItemKindMethod = { fg = c.purple, bg = c.none },
    CmpItemKindConstructor = { fg = c.purple, bg = c.none },

    CmpItemKindClass = { fg = c.orange, bg = c.none },
    CmpItemKindInterface = { fg = c.orange, bg = c.none },
    CmpItemKindStruct = { fg = c.orange, bg = c.none },
    CmpItemKindEvent = { fg = c.orange, bg = c.none },
    CmpItemKindEnum = { fg = c.orange, bg = c.none },
    CmpItemKindUnit = { fg = c.orange, bg = c.none },

    CmpItemKindModule = { fg = c.yellow, bg = c.none },
    CmpItemKindPackage = { fg = c.yellow, bg = c.none },

    CmpItemKindProperty = { fg = c.green, bg = c.none },
    CmpItemKindField = { fg = c.green, bg = c.none },
    CmpItemKindTypeParameter = { fg = c.green, bg = c.none },
    CmpItemKindEnumMember = { fg = c.green, bg = c.none },
    CmpItemKindOperator = { fg = c.green, bg = c.none },
    CmpItemKindSnippet = { fg = c.none_text, bg = c.none },

    -- headlines.nvim
    CodeBlock = { bg = c.dark_bg },

    -- navic
    NavicIconsFile = { fg = c.fg, bg = c.none },
    NavicIconsModule = { fg = c.yellow, bg = c.none },
    NavicIconsNamespace = { fg = c.fg, bg = c.none },
    NavicIconsPackage = { fg = c.fg, bg = c.none },
    NavicIconsClass = { fg = c.orange, bg = c.none },
    NavicIconsMethod = { fg = c.purple, bg = c.none },
    NavicIconsProperty = { fg = c.green, bg = c.none },
    NavicIconsField = { fg = c.green, bg = c.none },
    NavicIconsConstructor = { fg = c.orange, bg = c.none },
    NavicIconsEnum = { fg = c.orange, bg = c.none },
    NavicIconsInterface = { fg = c.orange, bg = c.none },
    NavicIconsFunction = { fg = c.purple, bg = c.none },
    NavicIconsVariable = { fg = c.pink, bg = c.none },
    NavicIconsConstant = { fg = c.pink, bg = c.none },
    NavicIconsString = { fg = c.green, bg = c.none },
    NavicIconsNumber = { fg = c.orange, bg = c.none },
    NavicIconsBoolean = { fg = c.orange, bg = c.none },
    NavicIconsArray = { fg = c.orange, bg = c.none },
    NavicIconsObject = { fg = c.orange, bg = c.none },
    NavicIconsKey = { fg = c.purple, bg = c.none },
    NavicIconsKeyword = { fg = c.purple, bg = c.none },
    NavicIconsNull = { fg = c.orange, bg = c.none },
    NavicIconsEnumMember = { fg = c.green, bg = c.none },
    NavicIconsStruct = { fg = c.orange, bg = c.none },
    NavicIconsEvent = { fg = c.orange, bg = c.none },
    NavicIconsOperator = { fg = c.fg, bg = c.none },
    NavicIconsTypeParameter = { fg = c.green, bg = c.none },
    NavicText = { fg = c.fg, bg = c.none },
    NavicSeparator = { fg = c.fg, bg = c.none },

    AerialFileIcon = { fg = c.fg, bg = c.none },
    AerialModuleIcon = { fg = c.yellow, bg = c.none },
    AerialNamespaceIcon = { fg = c.cyan, bg = c.none },
    AerialPackageIcon = { fg = c.cyan, bg = c.none },
    AerialClassIcon = { fg = c.orange, bg = c.none },
    AerialMethodIcon = { fg = c.purple, bg = c.none },
    AerialPropertyIcon = { fg = c.green, bg = c.none },
    AerialFieldIcon = { fg = c.green, bg = c.none },
    AerialConstructorIcon = { fg = c.orange, bg = c.none },
    AerialEnumIcon = { fg = c.orange, bg = c.none },
    AerialInterfaceIcon = { fg = c.orange, bg = c.none },
    AerialFunctionIcon = { fg = c.purple, bg = c.none },
    AerialVariableIcon = { fg = c.pink, bg = c.none },
    AerialConstantIcon = { fg = c.pink, bg = c.none },
    AerialStringIcon = { fg = c.green, bg = c.none },
    AerialNumberIcon = { fg = c.orange, bg = c.none },
    AerialBooleanIcon = { fg = c.orange, bg = c.none },
    AerialArrayIcon = { fg = c.orange, bg = c.none },
    AerialObjectIcon = { fg = c.orange, bg = c.none },
    AerialKeyIcon = { fg = c.purple, bg = c.none },
    AerialKeywordIcon = { fg = c.purple, bg = c.none },
    AerialNullIcon = { fg = c.orange, bg = c.none },
    AerialEnumMemberIcon = { fg = c.green, bg = c.none },
    AerialStructIcon = { fg = c.orange, bg = c.none },
    AerialEventIcon = { fg = c.orange, bg = c.none },
    AerialOperatorIcon = { fg = c.cyan, bg = c.none },
    AerialTypeParameterIcon = { fg = c.green, bg = c.none },
    AerialNormal = { fg = c.fg, bg = c.none },
    AerialGuide = { fg = c.none_text },
    AerialLine = { link = "LspInlayHint" },

    IndentBlanklineChar = { fg = c.none_text, nocombine = true },
    IndentBlanklineContextChar = { fg = c.purple, nocombine = true },
    IblIndent = { fg = c.none_text, nocombine = true },
    IblScope = { fg = c.purple, nocombine = true },

    -- Scrollbar
    ScrollbarHandle = { fg = c.none, bg = c.light_bg },

    ScrollbarSearchHandle = { fg = c.orange, bg = c.light_bg },
    ScrollbarSearch = { fg = c.orange, bg = c.none },

    ScrollbarErrorHandle = { fg = c.red, bg = c.light_bg },
    ScrollbarError = { fg = c.red, bg = c.none },

    ScrollbarWarnHandle = { fg = c.yellow, bg = c.light_bg },
    ScrollbarWarn = { fg = c.yellow, bg = c.none },

    ScrollbarInfoHandle = { fg = c.cyan, bg = c.light_bg },
    ScrollbarInfo = { fg = c.cyan, bg = c.none },

    ScrollbarHintHandle = { fg = c.teal, bg = c.light_bg },
    ScrollbarHint = { fg = c.teal, bg = c.none },

    ScrollbarMiscHandle = { fg = c.purple, bg = c.light_bg },
    ScrollbarMisc = { fg = c.purple, bg = c.none },

    -- Yanky
    YankyPut = { link = "IncSearch" },
    YankyYanked = { link = "IncSearch" },

    -- Lazy
    LazyProgressDone = { bold = true, fg = c.pink },
    LazyProgressTodo = { bold = true, fg = c.selection },

    -- Notify
    NotifyBackground = { fg = c.fg, bg = c.bg },
    --- Border
    NotifyERRORBorder = { fg = make_alpha(c.red, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyWARNBorder = { fg = make_alpha(c.yellow, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyINFOBorder = { fg = make_alpha(c.cyan, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyDEBUGBorder = { fg = make_alpha(c.comment, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyTRACEBorder = { fg = make_alpha(c.purple, 0.3), bg = options.transparent and c.none or c.bg },
    --- Icons
    NotifyERRORIcon = { fg = c.red },
    NotifyWARNIcon = { fg = c.yellow },
    NotifyINFOIcon = { fg = c.cyan },
    NotifyDEBUGIcon = { fg = c.comment },
    NotifyTRACEIcon = { fg = c.purple },
    --- Title
    NotifyERRORTitle = { fg = c.red },
    NotifyWARNTitle = { fg = c.yellow },
    NotifyINFOTitle = { fg = c.cyan },
    NotifyDEBUGTitle = { fg = c.comment },
    NotifyTRACETitle = { fg = c.purple },
    --- Body
    NotifyERRORBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyWARNBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyINFOBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyDEBUGBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyTRACEBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },

    -- Mini
    MiniCompletionActiveParameter = { underline = true },

    MiniCursorword = { bg = c.selection },
    MiniCursorwordCurrent = { bg = c.selection },

    MiniIndentscopeSymbol = { fg = c.purple, nocombine = true },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

    MiniJump = { bg = c.pink, fg = c.white },

    MiniJump2dSpot = { fg = c.pink, bold = true, nocombine = true },

    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = c.purple, italic = true },
    MiniStarterHeader = { fg = c.pink },
    MiniStarterInactive = { fg = c.comment, style = options.styles.comments },
    MiniStarterItem = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    MiniStarterItemBullet = { fg = c.border_hl },
    MiniStarterItemPrefix = { fg = c.yellow },
    MiniStarterSection = { fg = c.pink },
    MiniStarterQuery = { fg = c.cyan },

    MiniStatuslineDevinfo = { fg = c.dark_fg, bg = c.light_bg },
    MiniStatuslineFileinfo = { fg = c.dark_fg, bg = c.light_bg },
    MiniStatuslineFilename = { fg = c.dark_fg, bg = c.selection },
    MiniStatuslineInactive = { fg = c.purple, bg = c.darker_bg },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
    MiniStatuslineModeNormal = { fg = c.black, bg = c.purple, bold = true },
    MiniStatuslineModeOther = { fg = c.black, bg = c.teal, bold = true },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
    MiniStatuslineModeVisual = { fg = c.black, bg = c.pink, bold = true },

    MiniSurround = { bg = c.orange, fg = c.black },

    MiniTablineCurrent = { fg = c.fg, bg = c.light_bg },
    MiniTablineFill = { bg = c.black },
    MiniTablineHidden = { fg = c.none_text, bg = c.darker_bg },
    MiniTablineModifiedCurrent = { fg = c.yellow, bg = c.light_bg },
    MiniTablineModifiedHidden = { bg = c.darker_bg, fg = make_alpha(c.yellow, 0.7) },
    MiniTablineModifiedVisible = { fg = c.yellow, bg = c.darker_bg },
    MiniTablineTabpagesection = { bg = c.darker_bg, fg = c.none },
    MiniTablineVisible = { fg = c.fg, bg = c.darker_bg },

    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.green, bold = true },

    MiniTrailspace = { bg = c.red },

    -- Noice

    NoiceCompletionItemKindDefault = { fg = c.dark_fg, bg = c.none },

    NoiceCompletionItemKindKeyword = { fg = c.cyan, bg = c.none },

    NoiceCompletionItemKindVariable = { fg = c.pink, bg = c.none },
    NoiceCompletionItemKindConstant = { fg = c.pink, bg = c.none },
    NoiceCompletionItemKindReference = { fg = c.pink, bg = c.none },
    NoiceCompletionItemKindValue = { fg = c.pink, bg = c.none },

    NoiceCompletionItemKindFunction = { fg = c.purple, bg = c.none },
    NoiceCompletionItemKindMethod = { fg = c.purple, bg = c.none },
    NoiceCompletionItemKindConstructor = { fg = c.purple, bg = c.none },

    NoiceCompletionItemKindClass = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindInterface = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindStruct = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindEvent = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindEnum = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindUnit = { fg = c.orange, bg = c.none },

    NoiceCompletionItemKindModule = { fg = c.yellow, bg = c.none },

    NoiceCompletionItemKindProperty = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindField = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindTypeParameter = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindEnumMember = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindOperator = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindSnippet = { fg = c.none_text, bg = c.none },

    TreesitterContext = { bg = make_alpha(c.selection, 0.8) },
    Hlargs = { fg = c.yellow },
    -- TreesitterContext = { bg = util.darken(c.bg_visual, 0.4) },
  }

  local markdown_rainbow = { c.purple, c.yellow, c.orange, c.green, c.cyan, c.pink }

  for i, color in ipairs(markdown_rainbow) do
    theme.highlights["@text.title." .. i .. ".markdown"] = { fg = color, bold = true }
    theme.highlights["Headline" .. i] = { bg = make_alpha(color, 0.05) }
  end
  theme.highlights["Headline"] = { link = "Headline1" }

  if not vim.diagnostic then
    local severity_map = {
      Error = "Error",
      Warn = "Warning",
      Info = "Information",
      Hint = "Hint",
    }
    local types = { "Default", "VirtualText", "Underline" }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.highlights["LspDiagnostics" .. type .. sold] = {
          link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
        }
      end
    end
  end

  ---@type table<string, table>
  theme.defer = {}

  if options.hide_inactive_statusline then
    local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border_hl }

    -- StatusLineNC
    theme.highlights.StatusLineNC = inactive

    -- LuaLine
    for _, section in ipairs({ "a", "b", "c" }) do
      theme.defer["lualine_" .. section .. "_inactive"] = inactive
    end

    -- mini.statusline
    theme.highlights.MiniStatuslineInactive = inactive
  end

  options.on_highlights(theme.highlights, theme.colors)

  if config.is_day() then
    util.invert_colors(theme.colors)
    util.invert_highlights(theme.highlights)
  end

  return theme
end

return M
