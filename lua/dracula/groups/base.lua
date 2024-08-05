local util = require("dracula.util")

local M = {}

---@type DraculaHighlightsFn
function M.get(c, opts)
  return {
    Foo = { bg = c.pink, fg = c.fg },

    Comment = { fg = c.comment, style = opts.styles.comments }, -- any comment
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
    FoldColumn = { bg = opts.transparent and c.none or c.bg, fg = c.comment }, -- 'foldcolumn'
    SignColumn = { bg = opts.transparent and c.none or c.bg, fg = c.gutter.fg }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.sidebar.bg, fg = c.gutter.fg }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.gutter.fg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove = { fg = c.gutter.fg },
    LineNrBelow = { fg = c.gutter.fg },
    CursorLineNr = { fg = c.fg, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.orange, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.dark.fg, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.dark.fg }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.purple }, -- |more-prompt|
    NonText = { fg = c.gutter.fg }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = opts.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = opts.transparent and c.none or opts.dim_inactive and c.dark.bg or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.sidebar.fg, bg = c.sidebar.bg }, -- normal text in sidebar
    NormalFloat = { fg = c.float.fg, bg = c.float.bg }, -- Normal text in floating windows.
    FloatBorder = { fg = c.border, bg = c.float.bg },
    FloatTitle = { fg = c.pink, bg = c.float.bg },
    Pmenu = { bg = c.popup.bg, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = c.selection }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.blend(c.popup.bg, 0.95, c.fg) }, -- Popup menu: scrollbar.
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

    Identifier = { fg = c.cyan, style = opts.styles.variables }, -- (preferred) any variable name
    Function = { fg = c.green, style = opts.styles.functions }, -- function name (also: methods for classes)

    Statement = { fg = c.pink, style = opts.styles.keywords }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.pink }, -- "sizeof", "+", "*", etc.
    -- Keyword = { }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.pink, style = opts.styles.keywords }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.cyan }, -- (preferred) int, long, char, etc.
    StorageClass = { link = "Keyword" }, -- static, register, volatile, etc.
    Structure = { link = "Keyword" }, --  struct, union, enum, etc.
    Typedef = { link = "Keyword" }, --  A typedef

    Special = { fg = c.purple, italic = true }, -- (preferred) any special symbol
    SpecialChar = { fg = c.bright_blue, italic = true }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    Delimiter = { link = "Special" }, --  character that needs attention
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

    helpCommand = { bg = c.black, fg = c.purple },

    debugPC = { bg = c.sidebar.bg }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = util.blend_bg(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug

    dosIniLabel = { link = "@property" },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.gutter.fg }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.gutter.fg }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.gutter.fg }, -- used for highlighting "write" references

    LspSignatureActiveParameter = { bg = util.blend_bg(c.visual, 0.4), bold = true },
    LspCodeLens = { fg = c.comment },
    LspInlayHint = { fg = util.blend_bg(c.fg, 0.5), italic = true },

    LspInfoBorder = { fg = c.border, bg = c.float.bg },

    -- diagnostics
    DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = util.blend_bg(c.fg, 0.6) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { bg = util.blend_bg(c.error, 0.1), fg = c.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = util.blend_bg(c.warning, 0.1), fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = util.blend_bg(c.info, 0.1), fg = c.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = util.blend_bg(c.hint, 0.1), fg = c.hint }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { undercurl = true, sp = c.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }, -- Used to underline "Hint" diagnostics

    -- Health
    healthError = { fg = c.error },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.warning },

    -- diff (not need anymore?)
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.purple },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.pink },
  }
end

return M
