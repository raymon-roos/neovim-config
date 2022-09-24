-- Modules required() with `plugins.` prefixed, are custom configuration files for said plugins 
-- Modules required() ending in `.setup()` are plugins with all default configuration 
-- Modules required() with `core.` prefixed, are custom configuration files for nvim itself (i.e. vim.o. for instance)

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup({function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    -------------------------------------------------------
    -- Appearance
    -------------------------------------------------------
    use {
      { -- Color scheme 
        'ellisonleao/gruvbox.nvim',
        config = function() require('plugins.gruvbox') end
      },
      { -- status line
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.lualine') end
      }
    }

    -------------------------------------------------------
    -- Coding quality of life
    -------------------------------------------------------
    use {
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
      {
        'kylechui/nvim-surround',
        config = function() require('nvim-surround').setup() end
      }
    }

    -------------------------------------------------------
    -- lsp related *Note the order in which the plugins are loaded*
    -------------------------------------------------------
    use {
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
        bufread = false,
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
          'neovim/nvim-lspconfig',
          'nvim-lua/plenary.nvim'
        },
        config = function() require('plugins.null_ls') end
      }
    }

    -------------------------------------------------------
    -- Auto-completion
    -------------------------------------------------------
    use { -- Completion sources
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      -- Snippets
      'saadparwaiz1/cmp_luasnip',     -- luasnip integration for cmp
      'rafamadriz/friendly-snippets', -- More snippets to use with luasnip
      'L3MON4D3/LuaSnip',             -- Snippet engine itself

      -- Auto-completion engine itself
      { 'hrsh7th/nvim-cmp',
        config = function() require('plugins.cmp') end
      }
    }

  -------------------------------------------------------
  -- Single-purpose plugins
  -------------------------------------------------------
    use { -- latex integration for vim
      'lervag/vimtex',
      opt = true,
      ft = {'tex', 'bib'}
    }

    use { -- Git tracking integration in nvim
      'lewis6991/gitsigns.nvim',
      config = function()
	require('plugins.gitsigns') end
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
