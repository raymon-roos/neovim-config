require('telescope').load_extension('neoclip')
require('telescope').load_extension('macroscope')
require('neoclip').setup(
  {
    history = 100,
    enable_persistent_history = false,
    length_limit = 524288,
    continuous_sync = false,
    -- db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
    filter = nil,
    preview = true,
    prompt = nil,
    default_register = { '"', '+', '0' },
    enable_macro_history = true,
    content_spec_column = false,
    on_select = {
      move_to_front = false,
      close_telescope = true,
    },
    on_paste = {
      set_reg = false,
      move_to_front = false,
      close_telescope = true,
    },
    on_replay = {
      set_reg = false,
      move_to_front = false,
      close_telescope = true,
    },
    on_custom_action = {
      close_telescope = true,
    },
    keys = {
      telescope = {
        i = {
          select = '<cr>',
          paste = '<c-p>',
          paste_behind = '<c-k>',
          replay = '<c-r>', -- replay a macro
          delete = '<c-d>', -- delete an entry
          edit = '<c-e>',   -- edit an entry
          custom = {},
          close = '<c-c>',
        },
        n = {
          select = '<cr>',
          paste = 'p',
          --- It is possible to map to more than one key.
          -- paste = { 'p', '<c-p>' },
          paste_behind = 'P',
          replay = 'r',
          close = 'q',
          delete = 'd',
          edit = 'e',
          custom = {},
        },
      },
    },
  }
)
