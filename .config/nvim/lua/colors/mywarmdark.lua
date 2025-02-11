vim.opt.termguicolors = true

local function set_hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
    bg          = "#181818",
    fg          = "#e4e4ef",
    comment     = "#b27f27",
    red         = "#ff6c60",
    yellow      = "#ffdd33",
    yellowplus  = "#c9a410",
    orange      = "#e4c26b",
    green       = "#50bf50",
    cyan        = "#799fc4",
    blue        = "#2235e2",
    purple      = "#9d59b2",
    subtle_bg   = "#555555", -- Slightly lighter than bg
}

-- Basic UI
set_hl("Normal",       { fg = colors.fg, bg = colors.bg })
set_hl("Comment",      { fg = colors.comment, italic = true })
set_hl("Identifier",   { fg = colors.cyan })
set_hl("Statement",    { fg = colors.yellow, bold = true }) -- Keywords
set_hl("PreProc",      { fg = colors.orange }) -- Preprocessor, macros
set_hl("Type",         { fg = colors.yellow }) -- int, char, etc.
set_hl("Constant",     { fg = colors.orange }) -- Numbers, constants
set_hl("String",       { fg = colors.green }) -- String literals
set_hl("Function",     { fg = colors.cyan, bold = true }) -- Functions
set_hl("Error",        { fg = colors.red, bold = true }) -- Errors
set_hl("Cursor",       { bg = colors.yellowplus })

-- UI Elements
set_hl("LineNr",       { fg = colors.comment })
set_hl("CursorLineNr", { fg = colors.yellow, bold = true })
set_hl("Visual",       { bg = colors.subtle_bg })
set_hl("StatusLine",   { fg = colors.fg, bg = colors.subtle_bg })
set_hl("Pmenu",        { fg = colors.fg, bg = colors.subtle_bg })
set_hl("PmenuSel",     { fg = colors.bg, bg = colors.yellow, bold = true })
set_hl("VertSplit",    { fg = colors.comment })

-- Treesitter-Specific Highlighting
set_hl("TSFunction",   { fg = colors.cyan, bold = true })
set_hl("TSVariable",   { fg = colors.fg }) -- Regular variables
set_hl("TSKeyword",    { fg = colors.yellow, italic = true }) -- if, else, etc.
set_hl("TSString",     { fg = colors.green })
set_hl("TSComment",    { fg = colors.comment, italic = true })
set_hl("TSConstant",   { fg = colors.orange }) -- Constants
set_hl("TSType",       { fg = colors.purple }) -- Type definitions
set_hl("TSParameter",  { fg = colors.blue, italic = true }) -- Function params

-- LSP Diagnostics
set_hl("DiagnosticError", { fg = colors.red })
set_hl("DiagnosticWarn",  { fg = colors.yellow })
set_hl("DiagnosticInfo",  { fg = colors.blue })
set_hl("DiagnosticHint",  { fg = colors.green })

-- Git Signs
set_hl("GitGutterAdd",    { fg = colors.green })
set_hl("GitGutterChange", { fg = colors.yellow })
set_hl("GitGutterDelete", { fg = colors.red })
