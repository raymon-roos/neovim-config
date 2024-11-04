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
          layout_strategy = 'flex',
          layout_config = {
            flex = {
              horizontal = {
                preview_width = 0.60,
              },
              flip_columns = 180,
              width = 0.65,
              height = 0.8,
              anchor = 'c',
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
              preview_width = 0.55,
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
          diagnostics = {
            theme = 'ivy',
            layout_config = {
              height = 16,
              preview_width = 0.45,
            },
          },
          lsp_references = {
            theme = 'dropdown',
            layout_config = {
              width = 0.65,
              height = 0.35,
              anchor = 's',
            },
          },
          lsp_workspace_symbols = {
            theme = 'dropdown',
            layout_config = {
              width = 0.65,
              height = 0.35,
              anchor = 's',
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
