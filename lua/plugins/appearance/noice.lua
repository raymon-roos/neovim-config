return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    -- 'rcarriga/nvim-notify',
  },
  opts = {
    cmdline = {
      format = {
        cmdline = { title = '', },
        search_down = { title = '', },
        search_up = { title = '', },
        filter = {},
        lua = {},
        help = {},
        input = {},
      },
    },
    lsp = {
      hover = { enabled = false },
      signature = { enabled = false },
    },
    messages = {
      -- view_search = false,
    },
    presets = {
      command_palette = true,
      long_message_to_split = true,
    },
  },
}
