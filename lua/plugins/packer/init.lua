vim.cmd [[packadd packer.nvim]] -- Only required if you have packer configured as `opt`

require('packer').startup({
  function(use)
    use {
      { -- Packer can manage itself
        'wbthomason/packer.nvim',
        opt = true
      },
      -------------------------------------------------------
      -- Appearance
      -------------------------------------------------------
      { -- Color scheme
        'ellisonleao/gruvbox.nvim',
        disable = true,
        config = function() require('plugins.gruvbox') end
      },
      { -- Color scheme
        'RRethy/nvim-base16',
        config = function()
          vim.cmd([[ colorscheme base16-gruvbox-dark-hard ]])
          vim.api.nvim_set_hl(0, 'LspInfoBorder', { link = 'normalNC' })
        end
      },
      { -- status line
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.appearance.lualine') end
      },
      { -- fancy window dressing
        'stevearc/dressing.nvim',
        config = function() require('plugins.appearance.dressing') end
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
      },
      { -- Mason integration with lsp-config
        'williamboman/mason-lspconfig.nvim',
        buffread = false,
        requires = {
          'williamboman/mason.nvim',
        },
        config = function() require('mason-lspconfig').setup() end
      },
      { -- Collection of just-works configurations for lsp servers
        'neovim/nvim-lspconfig',
        require = {
          'williamboman/mason-lspconfig.nvim',
        },
        config = function() require('plugins.lsp') end
      },
      { -- Integrates non-lsp plugins into lsp framework
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
          'nvim-lua/plenary.nvim',
          'neovim/nvim-lspconfig',
        },
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
        config = function() require('plugins.ts') end,
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
        requires = 'nvim-treesitter/nvim-treesitter-refactor',
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
      { -- Free extra performance?
        'lewis6991/impatient.nvim',
        config = function() require('plugins.impatient') end
      },
      {
        'ggandor/leap.nvim',
        config = function() require('leap').add_default_mappings() end
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
