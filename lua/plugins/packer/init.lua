-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup({function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    -- Appearance
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

    -- Coding quality of life
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
      }
    }

    -- lsp related *Note the order in which the plugins are loaded*
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
        config = function() require("trouble").setup()  end
      },
      { -- Integrates seperate linter programs into nvim native diagnostics module
       'mfussenegger/nvim-lint',
       config = function() require('plugins.nvim_lint') end
      }
    }

    -- Auto-completion
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

    use {  -- latex integration for vim
      'lervag/vimtex',
      opt = true,
      ft = {'tex', 'bib'}
    }

  end,
  -- Settings for packer
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer/packer_compiled.lua',
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})

require('plugins.packer.packer_compiled') -- Needed when compiled autloads are not in their default location
