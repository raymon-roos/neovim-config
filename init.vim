if exists('g:vscode') " VSCode settings
    source "./vscode_nvim.vim"
else

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'nvim-lualine/lualine.nvim'
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

" Spellchecking config 
source $XDG_CONFIG_HOME/nvim/spellcheck.vim

" Zettelkasten config
" source $XDG_CONFIG_HOME/nvim/zettelkasten.vim

" lua / lsp / completion stuff
lua require('core.autocmds')
lua require('core.options')
lua require('core.keybindings')
lua require('plugins.lualine_conf')
lua require('plugins.lsp')
lua require('plugins.nvim_cmp')
lua require('plugins.zettelkasten')

" using lua to define vim user command
lua vim.api.nvim_command([[:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')']])
lua vim.api.nvim_command([[:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( {'.&ts.'})+#=repeat("\t", len(submatch(0))/' . &ts . ')']])

endif
