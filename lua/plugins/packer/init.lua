-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup({function(use)
    use { -- packer takes care of itself
	'wbthomason/packer.nvim',
	opt = true
    }

    use 'lervag/vimtex' -- latex integration for vim

    use { -- Color scheme 
      'ellisonleao/gruvbox.nvim',
      config = function() require('plugins.gruvbox') end
    }

    use { -- status line
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function() require('plugins.lualine') end
    }

    use { -- Autocomplete brackets while typing
      "windwp/nvim-autopairs",
      config = function() require('plugins.autopairs') end
    }

    use { -- LSP stuff
      { 'williamboman/mason.nvim', -- LSP server installer/manager
        -- opt = true,
	-- cmd = 'Mason/[0-9a-f]*', -- don't load untill we want to install something
	-- requires = 'williamboman/mason-lspconfig.nvim',
	config = function() require('plugins.mason') end
      },
      { 'williamboman/mason-lspconfig.nvim', -- lspconfig integration for Mason
        -- opt = true,
	-- cmd = 'Mason/[0-9a-f]*',
	-- requires = 'williamboman/mason.nvim'
      },

      -- Collection of basic lsp server configs
      { 'neovim/nvim-lspconfig',
        config = function() require('plugins.lsp') end
      },

      -- Integrates non-lsp plugins into lsp system
      -- { 'jose-elias-alvarez/null-ls.nvim',
      --   requires = { 'nvim-lua/plenary.nvim', opt = true}
      -- }
    }

    use { -- Diagnostics window
      'folke/trouble.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function() require("trouble").setup {} end
    }

    use { -- Auto completion sources
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      -- Snippets
      'L3MON4D3/LuaSnip', -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- luasnip integration for cmp
      'rafamadriz/friendly-snippets', -- More snippets to use with luasnip

      -- Auto completion engine itself
      { 'hrsh7th/nvim-cmp',
        config = function() require('plugins.cmp') end
      }
    }

  end,
  config = {
    compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer/packer_compiled.lua',
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})

require('plugins.packer.packer_compiled')
