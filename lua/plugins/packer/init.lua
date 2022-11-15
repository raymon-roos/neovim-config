vim.cmd [[packadd packer.nvim]] -- Only required if you have packer configured as `opt`

require('packer').startup({
  function(use)
    use {
      {
        'wbthomason/packer.nvim',
        opt = true
      },
      -------------------------------------------------------
      -- Appearance
      -------------------------------------------------------
      { -- Color scheme
        'ellisonleao/gruvbox.nvim',
        -- config = function() require('plugins.gruvbox') end
      },
      {
        'RRethy/nvim-base16',
        config = function() vim.cmd([[ colorscheme base16-gruvbox-dark-hard ]]) end
      },
      { -- status line
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.lualine') end
      },

      -------------------------------------------------------
      -- Coding quality of life
      -------------------------------------------------------
      { -- Autocomplete brackets while typing
        'windwp/nvim-autopairs',
        config = function() require('plugins.coding.autopairs') end
      },
      { -- Indentation guide
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('plugins.coding.indentguide') end
      },
      { -- easilly comment blocks of code
        'terrortylor/nvim-comment',
        config = function() require('plugins.coding.comment') end
      },
      { -- easilly suround text with given character or tag
        'kylechui/nvim-surround',
        config = function() require('nvim-surround').setup() end
      },

      -------------------------------------------------------
      -- lsp related *Note the order in which the plugins are loaded*
      -------------------------------------------------------
      { -- LSP server installer/manager
        'williamboman/mason.nvim',
        bufread = false,
        config = function() require('plugins.mason') end
      },
      { -- Mason integration with lsp-config
        'williamboman/mason-lspconfig.nvim',
        buffread = false,
        config = function() require('mason-lspconfig').setup() end
      },
      { -- Collection of just-works configurations for lsp servers
        'neovim/nvim-lspconfig',
        config = function() require('plugins.lsp') end
      },
      { -- Diagnostics window
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('trouble').setup() end
      },
      { -- Integrates non-lsp plugins into lsp framework
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
          'nvim-lua/plenary.nvim'
        },
        config = function() require('plugins.null_ls') end
      },

      -------------------------------------------------------
      -- Auto-completion
      -------------------------------------------------------
      {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'quangnguyen30192/cmp-nvim-tags',
      },
      { -- Snippet providers
        'saadparwaiz1/cmp_luasnip', -- luasnip integration for cmp
        'rafamadriz/friendly-snippets', -- More snippets to use with luasnip
        'L3MON4D3/LuaSnip', -- Snippet engine itself
      },
      { -- Auto-completion engine itself
        'hrsh7th/nvim-cmp',
        config = function() require('plugins.cmp') end
      },

      -------------------------------------------------------
      -- Tree sitter related
      -------------------------------------------------------
      {
        'nvim-treesitter/nvim-treesitter',
        config = function() require('plugins.treesitter') end,
        run = ':TSUpdate'
      },
      {
        'nvim-treesitter/nvim-treesitter-refactor'
      },
      {
        'windwp/nvim-ts-autotag',
        config = function() require('nvim-ts-autotag').setup() end
      },
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = function() require('plugins.ts_textobs') end
      },

      -------------------------------------------------------
      -- Single-purpose plugins
      -------------------------------------------------------
      { -- latex integration for vim
        'lervag/vimtex',
        opt = true,
        ft = { 'tex', 'bib' }
      },
      { -- Git tracking integration in nvim
        'lewis6991/gitsigns.nvim',
        config = function() require('plugins.gitsigns') end
      },
    }
  end,

  -------------------------------------------------------
  -- Settings for packer
  -------------------------------------------------------
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer/packer_compiled.lua',
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})
-- Needed when compiled autloads are not in their default location
require('plugins.packer.packer_compiled')
