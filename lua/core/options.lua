local o = vim.opt
local g = vim.g

g.filetype = 'plugin indent on'
g.syntax_on = true

o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true
o.number = true
o.relativenumber = true
o.wrap = true
o.linebreak  = true
o.breakindent  = true
o.scrolloff = 8
o.splitright = true
o.mouse = 'a'
o.cmdheight = 2
o.clipboard:append('unnamedplus')
o.ignorecase  = true
o.smartcase = true
o.updatetime = 300
o.timeoutlen = 500
o.undofile  = true
o.spell = false

g.netrw_liststyle = 3
g.netrw_banner = 0

o.background = 'dark'
o.termguicolors = true
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_transparent_bg = '1'
g.gruvbox_italic = '1'
vim.cmd [[colorscheme gruvbox]]

g.vimtex_quickfix_autoclose_after_keystrokes = 2
g.vimtex_complete_close_braces = 1
g.vimtex_view_method = 'mupdf'
