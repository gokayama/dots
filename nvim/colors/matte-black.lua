vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "matte-black"

local c = {
    bg = "#121212",
    fg = "#EAEAEA",
    gray = "#BEBEBE",
    dark = "#333333",
    orange = "#F59E0B",
    red = "#D65D5D",
    green = "#7FA650",
    blue = "#5F87AF",
    purple = "#875F87",
    cyan = "#5F8787",
}

local hl = vim.api.nvim_set_hl

hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg })
hl(0, "FloatBorder", { fg = c.dark, bg = c.bg })
hl(0, "Cursor", { fg = c.bg, bg = c.orange })
hl(0, "CursorLine", { bg = c.dark })
hl(0, "CursorLineNr", { fg = c.orange, bold = true })
hl(0, "LineNr", { fg = c.dark })
hl(0, "SignColumn", { fg = c.gray, bg = c.bg })

hl(0, "Visual", { fg = c.fg, bg = c.dark })
hl(0, "Search", { fg = c.bg, bg = c.orange })
hl(0, "IncSearch", { fg = c.bg, bg = c.orange })

hl(0, "Comment", { fg = c.gray, italic = true })
hl(0, "Constant", { fg = c.orange })
hl(0, "String", { fg = c.green })
hl(0, "Character", { fg = c.green })
hl(0, "Number", { fg = c.orange })
hl(0, "Boolean", { fg = c.orange })
hl(0, "Float", { fg = c.orange })

hl(0, "Identifier", { fg = c.fg })
hl(0, "Function", { fg = c.orange })
hl(0, "Statement", { fg = c.orange })
hl(0, "Keyword", { fg = c.orange })
hl(0, "Operator", { fg = c.gray })
hl(0, "PreProc", { fg = c.purple })
hl(0, "Type", { fg = c.blue })
hl(0, "Special", { fg = c.cyan })

hl(0, "Error", { fg = c.red })
hl(0, "WarningMsg", { fg = c.orange })
hl(0, "DiagnosticError", { fg = c.red })
hl(0, "DiagnosticWarn", { fg = c.orange })
hl(0, "DiagnosticInfo", { fg = c.blue })
hl(0, "DiagnosticHint", { fg = c.cyan })

hl(0, "Pmenu", { fg = c.fg, bg = c.dark })
hl(0, "PmenuSel", { fg = c.bg, bg = c.orange })
hl(0, "PmenuBorder", { fg = c.dark, bg = c.bg })

hl(0, "StatusLine", { fg = c.fg, bg = c.dark })
hl(0, "StatusLineNC", { fg = c.gray, bg = c.bg })

hl(0, "TabLine", { fg = c.gray, bg = c.bg })
hl(0, "TabLineSel", { fg = c.fg, bg = c.dark })
hl(0, "TabLineFill", { bg = c.bg })

hl(0, "Title", { fg = c.orange, bold = true })
hl(0, "Directory", { fg = c.blue })
hl(0, "MatchParen", { fg = c.orange, bold = true })

hl(0, "@variable", { fg = c.fg })
hl(0, "@variable.builtin", { fg = c.orange })
hl(0, "@function", { fg = c.orange })
hl(0, "@function.call", { fg = c.orange })
hl(0, "@keyword", { fg = c.orange })
hl(0, "@type", { fg = c.blue })
hl(0, "@string", { fg = c.green })
hl(0, "@constant", { fg = c.orange })
hl(0, "@comment", { fg = c.gray, italic = true })
hl(0, "@operator", { fg = c.gray })
hl(0, "@property", { fg = c.fg })
