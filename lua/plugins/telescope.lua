return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = 'telescope-fzf-native.nvim',
    opts = function()
      local actions = require('telescope.actions')

      return {
        defaults = {
          mappings = {
            n = {
              ['q'] = actions.close,
              ['<C-q>'] = actions.smart_send_to_qflist,
              ['<A-q>'] = actions.smart_add_to_qflist,
              ['<C-b>'] = actions.preview_scrolling_up,
              ['<C-f>'] = actions.preview_scrolling_down,
            },
            i = {
              ['<C-q>'] = actions.smart_send_to_qflist,
              ['<A-q>'] = actions.smart_add_to_qflist,
              ['<C-b>'] = actions.preview_scrolling_up,
              ['<C-f>'] = actions.preview_scrolling_down,
            },
          },
          layout_strategy = 'vertical',
          layout_config = {
            vertical = {
              width = 0.75,
              height = 0.8,
              anchor = 'c',
              preview_width = 0.75,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = {
              "fd",
              "--type",
              "file",
              "--hidden",
              "--strip-cwd-prefix",
              "--exclude",
              ".git",
            }
          },
          buffers = {
            theme = 'ivy',
            layout_config = {
              height = 24,
              preview_width = 0.65,
            },
            mappings = {
              n = {
                ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
              },
              i = {
                ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
              },
            },
          },
          quickfix = {
            theme = 'ivy',
            layout_config = {
              height = 30,
              preview_width = 0.50,
            },
          },
          spell_suggest = {
            theme = 'cursor',
            layout_config = {
              height = 14,
            },
          },
        },
        extensions = {},
      }
    end,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    build = 'make',
    enabled = vim.fn.executable('make') == 1,
    config = function()
      require('telescope').load_extension('fzf')
    end,
  },
}
