return {
  { import = 'plugins.appearance' },
  { import = 'plugins.coding' },
  { import = 'plugins.lsp' },
  { import = 'plugins.treesitter' },

  { -- Colorizer/color picker
    'uga-rosa/ccc.nvim',
    ft = { 'css', 'scss', 'html' },
    cmd = { 'CccPick', 'CccConvert', 'CccHighlighterToggle', 'CccHighlighterEnable', 'CccHighlighterEnable' },
  },

  { -- Easilly suround text with given character, tag or function call
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = true,
  },

  { -- Latex integration for vim
    'lervag/vimtex',
    ft = { 'tex', 'bib' },
  },

  { -- Git tracking integration in nvim
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
  },

  { -- Laravel's html template file type support
    'jwalton512/vim-blade',
    ft = { 'blade', 'blade.php' },
  },

  { -- Ledger filetype support
    'ledger/vim-ledger',
    ft = { 'journal', 'ledger', 'ldg' },
    init = function()
      vim.g.ledger_bin = "hledger"
      vim.g.ledger_fuzzy_account_completion = 1
      vim.g.ledger_date_format = "%Y-%m-%d"
      vim.g.ledger_align_at = 60
    end,
    opt = true,
  },

  { -- Helm chart file type support
    'towolf/vim-helm',
    ft = { 'yaml', 'helm' },
  },

  { -- Git conflict markers
    'akinsho/git-conflict.nvim',
    version = '*',
    event = 'VeryLazy',
    config = true
  },
}
