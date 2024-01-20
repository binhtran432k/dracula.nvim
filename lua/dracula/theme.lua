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
    CursorColumn = { bg = c.line }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.line }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.purple }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.black }, -- the column separating vertically split windows
    WinSeparator = { fg = c.black, bold = true }, -- the column separating vertically split windows
    Folded = { fg = c.purple, bg = c.gutter.fg }, -- line used for closed folds
    FoldColumn = { bg = options.transparent and c.none or c.bg, fg = c.comment }, -- 'foldcolumn'
    SignColumn = { bg = options.transparent and c.none or c.bg, fg = c.gutter.fg }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.sidebar.bg, fg = c.gutter.fg }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.gutter.fg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.fg, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.orange, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.dark.fg, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.dark.fg }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.purple }, -- |more-prompt|
    NonText = { fg = c.gutter.fg }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = options.transparent and c.none or options.dim_inactive and c.dark.bg or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.sidebar.fg, bg = c.sidebar.bg }, -- normal text in sidebar
    NormalFloat = { fg = c.float.fg, bg = c.float.bg }, -- Normal text in floating windows.
    FloatBorder = { fg = c.border, bg = c.float.bg },
    FloatTitle = { fg = c.pink, bg = c.float.bg },
    Pmenu = { bg = c.popup.bg, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = c.selection }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.blend(c.popup.bg, c.fg, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.gutter.fg }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.purple }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.visual, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.search, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.orange, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { link = "IncSearch" },
    SpecialKey = { fg = c.gutter.fg }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.sidebar.fg, bg = c.statusline }, -- status line of current window
    StatusLineNC = { fg = c.gutter.fg, bg = c.statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.statusline, fg = c.gutter.fg }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.black, bg = c.purple }, -- tab pages line, active tab page label
    Title = { fg = c.purple, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.visual }, -- Visual mode selection
    VisualNOS = { bg = c.visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.gutter.fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.visual }, -- current match in 'wildmenu' completion
    WinBar = { link = "StatusLine" }, -- window bar
    WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows

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

    Statement = { fg = c.pink }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.pink }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.pink, style = options.styles.keywords }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.pink }, -- (preferred) generic Preprocessor
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
    Debug = { fg = c.pink }, --    debugging statements

    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true },
    Italic = { italic = true },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.error }, -- (preferred) any erroneous construct
    Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = c.gutter.fg },
    qfFileName = { fg = c.purple },

    htmlH1 = { fg = c.pink, bold = true },
    htmlH2 = { fg = c.purple, bold = true },

    -- mkdHeading = { fg = c.orange, bold = true },
    -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = c.black, fg = c.fg },
    mkdCodeStart = { fg = c.teal, bold = true },
    mkdCodeEnd = { fg = c.teal, bold = true },
    -- mkdLink = { fg = c.blue, underline = true },

    markdownHeadingDelimiter = { fg = c.orange, bold = true },
    markdownCode = { fg = c.teal },
    markdownCodeBlock = { fg = c.teal },
    markdownH1 = { fg = c.pink, bold = true },
    markdownH2 = { fg = c.purple, bold = true },
    markdownLinkText = { fg = c.purple, underline = true },

    ["helpCommand"] = { bg = c.black, fg = c.purple },

    debugPC = { bg = c.sidebar.bg }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = make_alpha(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug

    dosIniLabel = { link = "@property" },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.gutter.fg }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.gutter.fg }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.gutter.fg }, -- used for highlighting "write" references

    DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = c.comment }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { bg = make_alpha(c.error, 0.1), fg = c.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = make_alpha(c.warning, 0.1), fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = make_alpha(c.info, 0.1), fg = c.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = make_alpha(c.hint, 0.1), fg = c.hint }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { undercurl = true, sp = c.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { bg = make_alpha(c.visual, 0.4), bold = true },
    LspCodeLens = { fg = c.comment },
    LspInlayHint = { bg = make_alpha(c.purple, 0.1), fg = c.gutter.fg },

    LspInfoBorder = { fg = c.border, bg = c.float.bg },

    ALEErrorSign = { fg = c.error },
    ALEWarningSign = { fg = c.warning },

    DapStoppedLine = { bg = make_alpha(c.warning, 0.1) }, -- Used for "Warning" diagnostic virtual text

    -- These groups are for the Neovim tree-sitter highlights.
    ["@annotation"] = { link = "PreProc" },
    ["@attribute"] = { link = "PreProc" },
    ["@boolean"] = { link = "Boolean" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@comment"] = { link = "Comment" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Special" },
    ["@constant.macro"] = { link = "Define" },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@number.float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Special" },
    ["@function.call"] = { link = "@function" },
    ["@function.macro"] = { link = "Macro" },
    ["@keyword.include"] = { link = "Include" },
    ["@keyword.coroutine"] = { link = "@keyword" },
    ["@keyword.operator"] = { link = "@operator" },
    ["@keyword.return"] = { link = "@keyword" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "@function.method" },
    ["@none"] = {},
    ["@number"] = { link = "Number" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.storage"] = { link = "StorageClass" },
    ["@string"] = { link = "String" },
    ["@markup"] = { link = "@none" },
    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "Type" },
    ["@markup.raw"] = { link = "String" },
    ["@markup.math"] = { link = "Special" },
    ["@markup.strong"] = { bold = true },
    ["@markup.emphasis"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { link = "Title" },
    ["@markup.link.label"] = { link = "SpecialChar" },
    ["@markup.link.label.symbol"] = { link = "Identifier" },
    ["@markup.link.url"] = { link = "Underlined" },
    ["@comment.hint"] = { fg = c.hint },
    ["@comment.error"] = { fg = c.error },
    ["@comment.info"] = { fg = c.info },
    ["@comment.warning"] = { fg = c.warning },
    ["@comment.todo"] = { fg = c.todo },
    ["@type"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"] = { link = "@keyword" },

    --- Misc
    -- TODO:
    -- ["@comment.documentation"] = { },
    ["@operator"] = { fg = c.pink }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@tag"] = { fg = c.cyan },
    ["@tag.attribute"] = { link = "@property" },
    ["@tag.delimiter"] = { link = "Delimiter" },

    --- Punctuation
    ["@punctuation.delimiter"] = { fg = c.fg }, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = { fg = c.dark.fg }, -- For brackets and parens.
    ["@markup.list"] = { fg = c.cyan }, -- For special punctutation that does not fall in the catagories before.
    ["@markup.list.markdown"] = { fg = c.purple, bold = true },

    --- Literals
    ["@string.documentation"] = { fg = c.yellow },
    ["@string.regexp"] = { fg = c.red }, -- For regexes.
    ["@string.escape"] = { fg = c.cyan }, -- For escape characters within a string.

    --- Functions
    ["@constructor"] = { fg = c.cyan }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@variable.parameter"] = { fg = c.orange }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = util.blend(c.orange, c.fg, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    --- Keywords
    ["@keyword"] = { fg = c.pink, style = options.styles.keywords }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = { fg = c.cyan, style = options.styles.functions }, -- For keywords used to define a fuction.
    ["@keyword.function.ruby"] = { fg = c.pink, style = options.styles.functions }, -- For keywords used to define a fuction.

    ["@label"] = { fg = c.cyan }, -- For labels: `label:` in C and `:label:` in Lua.

    --- Types
    ["@type.builtin"] = { fg = c.cyan, italic = true },
    ["@variable.member"] = { fg = c.bright_green }, -- For fields.
    ["@property"] = { fg = c.bright_green },

    --- Identifiers
    ["@variable"] = { fg = c.fg, style = options.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = c.purple, italic = true }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@module.builtin"] = { fg = c.orange, italic = true }, -- Variable names that are defined by the languages, like `this` or `self`.

    --- Text
    -- ["@markup.raw.markdown"] = { fg = c.purple },
    ["@markup.raw.markdown_inline"] = { bg = c.black, fg = c.purple },
    ["@markup.link"] = { fg = c.orange, bold = true },

    ["@markup.list.unchecked"] = { fg = c.cyan }, -- For brackets and parens.
    ["@markup.list.checked"] = { fg = c.green }, -- For brackets and parens.

    ["@diff.plus"] = { link = "DiffAdd" },
    ["@diff.minus"] = { link = "DiffDelete" },
    ["@diff.delta"] = { link = "DiffChange" },

    ["@module"] = { link = "Include" },

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
    ["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
    ["@lsp.type.generic"] = { link = "@variable" },
    ["@lsp.type.interface"] = { fg = make_alpha(c.cyan, 0.7) },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
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
    TroubleText = { fg = c.dark.fg },
    TroubleCount = { fg = c.pink, bg = c.gutter.fg },
    TroubleNormal = { fg = c.fg, bg = c.sidebar.bg },

    -- Illuminate
    illuminatedWord = { bg = make_alpha(c.gutter.fg, 0.5) },
    illuminatedCurWord = { bg = make_alpha(c.gutter.fg, 0.5) },
    IlluminatedWordText = { bg = make_alpha(c.gutter.fg, 0.5) },
    IlluminatedWordRead = { bg = make_alpha(c.gutter.fg, 0.5) },
    IlluminatedWordWrite = { bg = make_alpha(c.gutter.fg, 0.5) },

    -- diff
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.purple },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.pink },

    -- Neogit
    NeogitBranch = { fg = c.pink },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.gutter.bg, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.gutter.fg, fg = c.purple },
    NeogitDiffContextHighlight = { bg = make_alpha(c.gutter.fg, 0.5), fg = c.dark.fg },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = make_alpha(c.diff.delete, 0.1) },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = make_alpha(c.diff.add, 0.1) },

    -- Neotest
    NeotestPassed = { fg = c.green },
    NeotestRunning = { fg = c.yellow },
    NeotestFailed = { fg = c.red },
    NeotestSkipped = { fg = c.cyan },
    NeotestTest = { fg = c.sidebar.fg },
    NeotestNamespace = { fg = c.bright_green },
    NeotestFocused = { fg = c.yellow },
    NeotestFile = { fg = c.teal },
    NeotestDir = { fg = c.purple },
    NeotestBorder = { fg = c.border },
    NeotestIndent = { fg = c.sidebar.fg },
    NeotestExpandMarker = { fg = c.sidebar.fg },
    NeotestAdapterName = { fg = c.pink, bold = true },
    NeotestWinSelect = { fg = c.purple },
    NeotestMarked = { fg = c.purple },
    NeotestTarget = { fg = c.purple },
    --[[ NeotestUnknown = {}, ]]

    -- GitGutter
    GitGutterAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|
    GitGutterAddLineNr = { fg = c.gitSigns.add },
    GitGutterChangeLineNr = { fg = c.gitSigns.change },
    GitGutterDeleteLineNr = { fg = c.gitSigns.delete },

    -- GitSigns
    GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeTitle = { fg = c.pink, bg = c.float.bg },
    TelescopeBorder = { fg = c.border, bg = c.float.bg },
    TelescopeNormal = { fg = c.fg, bg = c.float.bg },

    -- NvimTree
    NvimTreeNormal = { fg = c.sidebar.fg, bg = c.sidebar.bg },
    NvimTreeWinSeparator = {
      fg = options.styles.sidebars == "transparent" and c.black or c.sidebar.fg,
      bg = c.sidebar.bg,
    },
    NvimTreeNormalNC = { fg = c.sidebar.fg, bg = c.sidebar.bg },
    NvimTreeRootFolder = { fg = c.purple, bold = true },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeOpenedFile = { bg = c.gutter.bg },
    NvimTreeSpecialFile = { fg = c.purple, underline = true },
    NvimTreeIndentMarker = { fg = c.gutter.fg },
    NvimTreeImageFile = { fg = c.sidebar.fg },
    NvimTreeSymlink = { fg = c.teal },
    NvimTreeFolderIcon = { bg = c.none, fg = c.purple },
    -- NvimTreeFolderName= { fg = c.float.fg },

    NeoTreeNormal = { fg = c.sidebar.fg, bg = c.sidebar.bg },
    NeoTreeNormalNC = { fg = c.sidebar.fg, bg = c.sidebar.bg },
    NeoTreeDimText = { fg = c.gutter.fg },

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
    WhichKeyFloat = { bg = c.sidebar.bg },
    WhichKeyValue = { fg = c.sidebar.fg },

    -- LspSaga
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },

    LspFloatWinNormal = { bg = c.float.bg },
    LspFloatWinBorder = { fg = c.border },
    LspSagaBorderTitle = { fg = c.pink },
    LspSagaHoverBorder = { fg = c.purple },
    LspSagaRenameBorder = { fg = c.green },
    LspSagaDefPreviewBorder = { fg = c.green },
    LspSagaCodeActionBorder = { fg = c.purple },
    LspSagaFinderSelection = { fg = c.visual },
    LspSagaCodeActionTitle = { fg = c.purple },
    LspSagaCodeActionContent = { fg = c.pink },
    LspSagaSignatureHelpBorder = { fg = c.red },
    ReferencesCount = { fg = c.pink },
    DefinitionCount = { fg = c.pink },
    DefinitionIcon = { fg = c.purple },
    ReferencesIcon = { fg = c.purple },
    TargetWord = { fg = c.cyan },

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.warning },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.purple },

    -- Barbar
    BufferCurrent = { bg = c.bg, fg = c.fg },
    BufferCurrentERROR = { bg = c.bg, fg = c.error },
    BufferCurrentHINT = { bg = c.bg, fg = c.hint },
    -- BufferCurrentIcon = { bg = c.bg, fg = c.},
    BufferCurrentINFO = { bg = c.bg, fg = c.info },
    BufferCurrentWARN = { bg = c.bg, fg = c.warning },
    BufferCurrentIndex = { bg = c.bg, fg = c.info },
    BufferCurrentMod = { bg = c.bg, fg = c.warning },
    BufferCurrentSign = { bg = c.bg, fg = c.bg },
    BufferCurrentTarget = { bg = c.bg, fg = c.red },
    BufferAlternate = { bg = c.gutter.fg, fg = c.fg },
    BufferAlternateERROR = { bg = c.gutter.fg, fg = c.error },
    BufferAlternateHINT = { bg = c.gutter.fg, fg = c.hint },
    -- BufferAlternateIcon = { bg = c.fg_gutter, fg = c. },
    BufferAlternateIndex = { bg = c.gutter.fg, fg = c.info },
    BufferAlternateINFO = { bg = c.gutter.fg, fg = c.info },
    BufferAlternateMod = { bg = c.gutter.fg, fg = c.warning },
    BufferAlternateSign = { bg = c.gutter.fg, fg = c.info },
    BufferAlternateTarget = { bg = c.gutter.fg, fg = c.red },
    BufferAlternateWARN = { bg = c.gutter.fg, fg = c.warning },
    BufferVisible = { bg = c.statusline, fg = c.fg },
    BufferVisibleERROR = { bg = c.statusline, fg = c.error },
    BufferVisibleHINT = { bg = c.statusline, fg = c.hint },
    -- BufferVisibleIcon = { bg = c.statusline, fg = c. },
    BufferVisibleINFO = { bg = c.statusline, fg = c.hint },
    BufferVisibleWARN = { bg = c.statusline, fg = c.warning },
    BufferVisibleIndex = { bg = c.statusline, fg = c.info },
    BufferVisibleMod = { bg = c.statusline, fg = c.warning },
    BufferVisibleSign = { bg = c.statusline, fg = c.info },
    BufferVisibleTarget = { bg = c.statusline, fg = c.red },
    BufferInactive = { bg = make_alpha(c.gutter.bg, 0.4), fg = make_alpha(c.gutter.fg, 0.8) },
    BufferInactiveERROR = { bg = make_alpha(c.gutter.bg, 0.4), fg = make_alpha(c.red, 0.8) },
    BufferInactiveHINT = { bg = make_alpha(c.gutter.bg, 0.4), fg = make_alpha(c.teal, 0.8) },
    -- BufferInactiveIcon = { bg = c.darker_bg, fg = make_alpha(c., 0.1) },
    BufferInactiveINFO = { bg = make_alpha(c.gutter.bg, 0.4), fg = make_alpha(c.cyan, 0.8) },
    BufferInactiveWARN = { bg = make_alpha(c.gutter.bg, 0.4), fg = make_alpha(c.yellow, 0.8) },
    BufferInactiveIndex = { bg = make_alpha(c.gutter.bg, 0.4), fg = c.gutter.fg },
    BufferInactiveMod = { bg = make_alpha(c.gutter.bg, 0.4), fg = make_alpha(c.yellow, 0.8) },
    BufferInactiveSign = { bg = make_alpha(c.gutter.bg, 0.4), fg = c.bg },
    BufferInactiveTarget = { bg = make_alpha(c.gutter.bg, 0.4), fg = c.red },
    BufferOffset = { bg = c.statusline, fg = c.gutter.fg },
    BufferTabpageFill = { bg = make_alpha(c.gutter.bg, 0.8), fg = c.gutter.fg },
    BufferTabpages = { bg = c.statusline, fg = c.none },

    -- Sneak
    Sneak = { fg = c.gutter.bg, bg = c.pink },
    SneakScope = { bg = c.visual },

    -- Hop
    HopNextKey = { fg = c.search_alt, bold = true },
    HopNextKey1 = { fg = c.search, bold = true },
    HopNextKey2 = { fg = make_alpha(c.search, 0.6) },
    HopUnmatched = { fg = c.inactive },

    TSNodeKey = { fg = c.pink, bold = true },
    TSNodeUnmatched = { fg = c.inactive },

    LeapMatch = { bg = c.search_alt, fg = c.fg, bold = true },
    LeapLabelPrimary = { fg = c.search, bold = true },
    LeapLabelSecondary = { fg = c.cyan, bold = true },
    LeapBackdrop = { fg = c.inactive },

    FlashBackdrop = { fg = c.inactive },
    FlashLabel = { bg = c.search_alt, bold = true, fg = c.fg },

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
    CmpDocumentation = { fg = c.fg, bg = c.float.bg },
    CmpDocumentationBorder = { fg = c.border, bg = c.float.bg },
    CmpGhostText = { fg = c.inactive },

    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.gutter.fg, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.cyan, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, bg = c.none },

    CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindDefault = { fg = c.dark.fg, bg = c.none },

    CmpItemKindKeyword = { fg = c.cyan, bg = c.none },

    CmpItemKindCopilot = { fg = c.teal, bg = c.none },
    CmpItemKindCodeium = { fg = c.teal, bg = c.none },
    CmpItemKindTabNine = { fg = c.teal, bg = c.none },

    -- headlines.nvim
    CodeBlock = { bg = c.dark.bg },

    -- navic
    NavicText = { fg = c.fg, bg = c.none },
    NavicSeparator = { fg = c.fg, bg = c.none },

    AerialNormal = { fg = c.fg, bg = c.none },
    AerialGuide = { fg = c.gutter.fg },
    AerialLine = { link = "LspInlayHint" },

    IndentBlanklineChar = { fg = c.gutter.fg, nocombine = true },
    IndentBlanklineContextChar = { fg = c.purple, nocombine = true },
    IblIndent = { fg = c.gutter.fg, nocombine = true },
    IblScope = { fg = c.purple, nocombine = true },

    -- Scrollbar
    ScrollbarHandle = { fg = c.none, bg = c.gutter.bg },

    ScrollbarSearchHandle = { fg = c.orange, bg = c.gutter.bg },
    ScrollbarSearch = { fg = c.orange, bg = c.none },

    ScrollbarErrorHandle = { fg = c.error, bg = c.gutter.bg },
    ScrollbarError = { fg = c.error, bg = c.none },

    ScrollbarWarnHandle = { fg = c.warning, bg = c.gutter.bg },
    ScrollbarWarn = { fg = c.warning, bg = c.none },

    ScrollbarInfoHandle = { fg = c.info, bg = c.gutter.bg },
    ScrollbarInfo = { fg = c.info, bg = c.none },

    ScrollbarHintHandle = { fg = c.hint, bg = c.gutter.bg },
    ScrollbarHint = { fg = c.hint, bg = c.none },

    ScrollbarMiscHandle = { fg = c.purple, bg = c.gutter.bg },
    ScrollbarMisc = { fg = c.purple, bg = c.none },

    -- Yanky
    YankyPut = { link = "IncSearch" },
    YankyYanked = { link = "IncSearch" },

    -- Lazy
    LazyProgressDone = { bold = true, fg = c.pink },
    LazyProgressTodo = { bold = true, fg = c.gutter.fg },

    -- Notify
    NotifyBackground = { fg = c.fg, bg = c.bg },
    --- Border
    NotifyERRORBorder = { fg = make_alpha(c.error, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyWARNBorder = { fg = make_alpha(c.warning, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyINFOBorder = { fg = make_alpha(c.info, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyDEBUGBorder = { fg = make_alpha(c.comment, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyTRACEBorder = { fg = make_alpha(c.purple, 0.3), bg = options.transparent and c.none or c.bg },
    --- Icons
    NotifyERRORIcon = { fg = c.error },
    NotifyWARNIcon = { fg = c.warning },
    NotifyINFOIcon = { fg = c.info },
    NotifyDEBUGIcon = { fg = c.comment },
    NotifyTRACEIcon = { fg = c.purple },
    --- Title
    NotifyERRORTitle = { fg = c.error },
    NotifyWARNTitle = { fg = c.warning },
    NotifyINFOTitle = { fg = c.info },
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
    MiniStarterItemBullet = { fg = c.border },
    MiniStarterItemPrefix = { fg = c.yellow },
    MiniStarterSection = { fg = c.pink },
    MiniStarterQuery = { fg = c.cyan },

    MiniStatuslineDevinfo = { fg = c.dark.fg, bg = c.gutter.bg },
    MiniStatuslineFileinfo = { fg = c.dark.fg, bg = c.gutter.bg },
    MiniStatuslineFilename = { fg = c.dark.fg, bg = c.selection },
    MiniStatuslineInactive = { fg = c.purple, bg = c.statusline },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
    MiniStatuslineModeNormal = { fg = c.black, bg = c.purple, bold = true },
    MiniStatuslineModeOther = { fg = c.black, bg = c.teal, bold = true },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
    MiniStatuslineModeVisual = { fg = c.black, bg = c.pink, bold = true },

    MiniSurround = { bg = c.orange, fg = c.black },

    MiniTablineCurrent = { fg = c.fg, bg = c.gutter.fg },
    MiniTablineFill = { bg = c.black },
    MiniTablineHidden = { fg = c.gutter.fg, bg = c.statusline },
    MiniTablineModifiedCurrent = { fg = c.yellow, bg = c.gutter.fg },
    MiniTablineModifiedHidden = { bg = c.statusline, fg = make_alpha(c.yellow, 0.7) },
    MiniTablineModifiedVisible = { fg = c.yellow, bg = c.statusline },
    MiniTablineTabpagesection = { bg = c.statusline, fg = c.none },
    MiniTablineVisible = { fg = c.fg, bg = c.statusline },

    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.green, bold = true },

    MiniTrailspace = { bg = c.red },

    -- Noice

    NoiceCompletionItemKindDefault = { fg = c.dark.fg, bg = c.none },

    TreesitterContext = { bg = make_alpha(c.gutter.fg, 0.8) },
    Hlargs = { fg = c.yellow },
    -- TreesitterContext = { bg = util.darken(c.bg_visual, 0.4) },
  }

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

  -- lsp symbol kind and completion kind highlights
  local kinds = {
    Array = "@punctuation.bracket",
    Boolean = "@boolean",
    Class = "@type",
    Color = "Special",
    Constant = "@constant",
    Constructor = "@constructor",
    Enum = "@lsp.type.enum",
    EnumMember = "@lsp.type.enumMember",
    Event = "Special",
    Field = "@variable.member",
    File = "Normal",
    Folder = "Directory",
    Function = "@function",
    Interface = "@lsp.type.interface",
    Key = "@variable.member",
    Keyword = "@lsp.type.keyword",
    Method = "@function.method",
    Module = "@module",
    Namespace = "@module",
    Null = "@constant.builtin",
    Number = "@number",
    Object = "@constant",
    Operator = "@operator",
    Package = "@module",
    Property = "@property",
    Reference = "@markup.link",
    Snippet = "Conceal",
    String = "@string",
    Struct = "@lsp.type.struct",
    Unit = "@lsp.type.struct",
    Text = "@markup",
    TypeParameter = "@lsp.type.typeParameter",
    Variable = "@variable",
    Value = "@string",
  }

  local kind_groups = { "NavicIcons%s", "Aerial%sIcon", "CmpItemKind%s", "NoiceCompletionItemKind%s" }
  for kind, link in pairs(kinds) do
    local base = "LspKind" .. kind
    theme.highlights[base] = { link = link }
    for _, plugin in pairs(kind_groups) do
      theme.highlights[plugin:format(kind)] = { link = base }
    end
  end

  local markdown_rainbow = { c.purple, c.yellow, c.orange, c.green, c.cyan, c.pink }

  for i, color in ipairs(markdown_rainbow) do
    theme.highlights["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
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
    local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.inactive }

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
