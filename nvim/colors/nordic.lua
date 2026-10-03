vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "nordic"

local hl = vim.api.nvim_set_hl

local c = {
    bg      = "#2e3440",
    fg      = "#d8dee9",

    border  = "#4c566a",
    gray    = "#616e88",

    blue    = "#81a1c1",
    teal    = "#88c0d0",
    green   = "#a3be8c",
    aqua    = "#8fbcbb",
}

hl(0, "Normal",       { fg = c.fg, bg = c.bg })

hl(0, "Comment",      { fg = c.gray, italic = true })

hl(0, "String",       { fg = c.green })
hl(0, "Number",       { fg = c.teal })

hl(0, "Function",     { fg = c.blue })

hl(0, "Keyword",      { fg = c.aqua, bold = true })
hl(0, "Statement",    { fg = c.aqua })

hl(0, "Type",         { fg = c.teal })

hl(0, "CursorLine",   { bg = "#3b4252" })
hl(0, "Visual",       { bg = c.border })

hl(0, "LineNr",       { fg = c.gray })
hl(0, "CursorLineNr", { fg = c.teal, bold = true })

hl(0, "StatusLine",   { fg = c.fg, bg = "#3b4252" })

hl(0, "Pmenu",        { fg = c.fg, bg = "#3b4252" })
hl(0, "PmenuSel",     { fg = c.bg, bg = c.teal })

hl(0, "NormalFloat",  { fg = c.fg, bg = "#3b4252" })
hl(0, "FloatBorder",  { fg = c.teal, bg = "#3b4252" })
