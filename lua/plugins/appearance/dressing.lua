return {
  'stevearc/dressing.nvim',
  dependencies = { 'telescope.nvim' },
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
  opts = {
    input = {
      enabled = true, -- Set to false to disable the vim.ui.input implementation
      default_prompt = 'Input:', -- Default prompt string
      prompt_align = 'left', -- Can be 'left', 'right', or 'center'
      insert_only = true, -- When true, <Esc> will close the modal
      start_in_insert = true, -- When true, input will start in insert mode.
      border = 'rounded', -- These are passed to nvim_open_win
      relative = 'cursor', -- 'editor' and 'win' will default to being centered
      prefer_width = 30, -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      width = nil,
      max_width = { 140, 0.9 }, -- min_width and max_width can be a list of mixed types.
      min_width = { 20, 0.15 }, -- min_width = {20, 0.2} means 'the greater of 20 columns or 20% of total'
      buf_options = {},
      win_options = {
        winblend = 10, -- Window transparency (0-100)
        wrap = false, -- Disable line wrapping
      },
      -- Set to `false` to disable
      mappings = {
        n = {
          ['<Esc>'] = 'Close',
          ['q'] = 'Close',
          ['<CR>'] = 'Confirm',
          ['<C-j>'] = 'Confirm',
        },
        i = {
          ['<C-c>'] = 'Close',
          ['<CR>'] = 'Confirm',
          ['<C-j>'] = 'Confirm',
          ['<C-p>'] = 'HistoryPrev',
          ['<Up>'] = 'HistoryPrev',
          ['<C-n>'] = 'HistoryNext',
          ['<Down>'] = 'HistoryNext',
        },
      },
      override = function(conf)
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        return conf
      end,
      -- see :help dressing_get_config
      get_config = nil,
    },
    select = {
      enabled = true, -- Set to false to disable the vim.ui.select implementation
      backend = { 'telescope', 'builtin', 'fzf_lua', 'fzf', 'nui' }, -- Priority list of preferred vim.select implementations
      trim_prompt = true, -- Trim trailing `:` from prompt
      -- Options for telescope selector
      -- These are passed into the telescope picker directly. Can be used like:
      -- telescope = require('telescope.themes').get_ivy({...})
      -- telescope = require('telescope.themes').get_cursor({
      --   initial_mode = 'normal',
      --   layout_config = {
      --     height = 14,
      --   },
      -- }),
      builtin = { -- Options for built-in selector
        border = 'rounded', -- These are passed to nvim_open_win
        relative = 'cursor', -- 'editor' and 'win' will default to being centered
        buf_options = {},
        win_options = {
          winblend = 40, -- Window transparency (0-100)
        },
        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- the min_ and max_ options can be a list of mixed types.
        -- max_width = {140, 0.8} means 'the lesser of 140 columns or 80% of total'
        width = nil,
        max_width = { 50, 0.4 },
        min_width = { 25, 0.1 },
        height = nil,
        max_height = { 50, 0.9 },
        min_height = { 8, 0.05 },
        -- Set to `false` to disable
        mappings = {
          ['<Esc>'] = 'Close',
          ['<C-c>'] = 'Close',
          ['q'] = 'Close',
          ['<CR>'] = 'Confirm',
          ['<C-j>'] = 'Confirm',
        },
        override = function(conf)
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          return conf
        end,
      },
      -- Used to override format_item. See :help dressing-format
      format_item_override = {},
      get_config = nil, -- see :help dressing_get_config
    },
  },
}
