return {
  'nvim-treesitter/nvim-treesitter-refactor',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
  dependencies = 'nvim-treesitter',
  opts = {
    refactor = {
      highlight_definitions = {
        enable = true,
        clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~100.
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = 'grr',
        },
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition_lsp_fallback = 'gd',
          list_definitions = 'gnD',
          list_definitions_toc = 'gO',
          goto_next_usage = '<a-*>',
          goto_previous_usage = '<a-#>',
        },
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
