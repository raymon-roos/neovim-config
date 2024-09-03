return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'VeryLazy',
  main = 'ibl',
  opts = {
    indent = {
      char = '·',
      tab_char = '▏',
    },
    scope = {
      show_start = false,
      show_end = false,
      priority = 2,
      -- highlight = 'CursorLineSign',
    },
    exclude = {
      filetypes = {
        'help',
        'mason',
      },
    },
  },
}
