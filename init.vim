if exists('g:vscode') " VSCode settings
  lua require ('core.vscode_nvim')
else
  call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
    Plug 'morhetz/gruvbox' "colour theme
    Plug 'nvim-lualine/lualine.nvim' "status line
    Plug 'lervag/vimtex' "latex integration
    Plug 'williamboman/mason.nvim' "lsp server installer
    Plug 'jose-elias-alvarez/null-ls.nvim' "basis for formatters/linters
    Plug 'williamboman/mason-lspconfig.nvim' "dependency for mason
    Plug 'neovim/nvim-lspconfig' "Collection of common lsp server configurations
    Plug 'nvim-lua/plenary.nvim' "Dependency for various modern lua plugins
    Plug 'hrsh7th/cmp-nvim-lsp' "Completion source for nvim-cmp, containing nvim client functions
    Plug 'hrsh7th/cmp-buffer' "Completion source of buffer words
    Plug 'hrsh7th/cmp-path' "Completion source of filesystem
    Plug 'hrsh7th/cmp-cmdline' "Completion source of shell commands
    Plug 'hrsh7th/nvim-cmp' "Smart auto completion
    Plug 'L3MON4D3/LuaSnip' "Snippet engine
    Plug 'saadparwaiz1/cmp_luasnip' "Luasnip integration into nvim-cmp
    Plug 'rafamadriz/friendly-snippets' "Collection of snippets, for luasnip
    Plug 'kyazdani42/nvim-web-devicons' "Icons font
    Plug 'folke/trouble.nvim' "Diagnostics window
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
