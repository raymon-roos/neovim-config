if exists('g:vscode') " VSCode settings
    set nonumber
    filetype indent off
    set nowrap 
    set scrolloff=8
else

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airlineairblade/vim-gitgutter'  
    Plug 'airblade/vim-gitgutter'  
    Plug 'lervag/vimtex'

    Plug 'williamboman/mason.nvim'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/plenary.nvim'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp' 

    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rafamadriz/friendly-snippets'

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim'
call plug#end()

filetype plugin indent on
syntax enable
set softtabstop=4
set shiftwidth=4
set autoindent smartindent
set number relativenumber
set wrap
set linebreak breakindent 
set cpoptions+=n
set scrolloff=8
set splitright
set mouse=a  
set cmdheight=2
set clipboard+=unnamedplus
set ignorecase smartcase
set updatetime=300
set timeoutlen=1000
set undofile

:packadd matchit
let g:netrw_liststyle=3
let g:netrw_banner=0

set background=dark
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg = '1'
let g:gruvbox_italic = '1'
colorscheme gruvbox

: let mapleader=" "

nnoremap j gj
nnoremap k gk
inoremap kj <esc>
cnoremap kj <C-C>

" windows
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 
nnoremap <silent> <leader>ee :exe "Lexplore 15" <CR>
nnoremap <silent> <leader>> :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <leader>< :exe "vertical resize " . (winwidth(0) * 4/5)<CR>
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 4/5)<CR>

nnoremap <silent> <leader>mm :exe "Mason" <CR>
nnoremap <silent> <leader>pp :exe "LspInfo" <CR>


nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Change directory to directory of current file
nnoremap <leader>cd :cd %:h<CR>:pwd<CR>

" Latex related
let g:vimtex_quickfix_autoclose_after_keystrokes = 2
let g:vimtex_complete_close_braces = 1
let g:vimtex_view_method = 'mupdf'
" let g:vimtex_view_mupdf_send_keys = '<shift>z'

" Spellchecking config 
source $XDG_CONFIG_HOME/nvim/spellcheck.vim

" Zettelkasten config
source $XDG_CONFIG_HOME/nvim/zettelkasten.vim

" lua / lsp / completion stuff
source $XDG_CONFIG_HOME/nvim/lua/lsp.lua 
source $XDG_CONFIG_HOME/nvim/lua/nvim_cmp.lua

endif
