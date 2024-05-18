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
  { -- Tint inactive windows
    'levouh/tint.nvim',
    event = 'VeryLazy',
    config = true,
  },

  { -- Easilly suround text with given character, tag or function call
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = true,
  },

  { -- latex integration for vim
    'lervag/vimtex',
    ft = { 'tex', 'bib' },
  },

  { -- Git tracking integration in nvim
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
  },

  { -- Cli markdown previewer integtration
    '0x00-ketsu/markdown-preview.nvim',
    ft = { 'md', 'markdown', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'rmd', 'wiki' },
    cmd = { 'MPToggle', 'MPOpen', 'MPClose', 'MPRefresh' },
  },

  { -- Laravel's html template file type support
    'jwalton512/vim-blade',
    ft = { 'blade', 'blade.php' },
  },
}
