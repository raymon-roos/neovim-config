local o = vim.opt
local g = vim.g

g.filetype = 'plugin indent on'
g.syntax_on = true

o.foldlevel = 2

o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.shiftwidth = 0
o.autoindent = true
o.smartindent = true
o.signcolumn = 'yes:1'
o.foldcolumn='auto'
o.numberwidth = 2
o.number = true
o.relativenumber = true
o.cursorline = true
o.wrap = true
o.linebreak  = true
o.breakindent  = true
o.scrolloff = 8
o.splitbelow = false
o.splitright = true
o.mouse = 'a'
o.cmdheight = 2
o.clipboard:append('unnamedplus')
o.ignorecase  = true
o.smartcase = true
o.updatetime = 600
o.timeoutlen = 600
o.undofile  = true
o.spell = false

if vim.fn.executable('rg') == 1 then
  o.grepprg='rg --vimgrep'
end

g.netrw_liststyle = 3
g.netrw_banner = 0

o.termguicolors = true
o.background = 'dark'

-- g.vimtex_quickfix_autoclose_after_keystrokes = 2
g.vimtex_complete_close_braces = 1
g.vimtex_view_method = 'mupdf'
