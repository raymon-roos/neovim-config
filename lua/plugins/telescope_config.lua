local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q']     = actions.close,
        ['<C-u>'] = actions.results_scrolling_up,
        ['<C-d>'] = actions.results_scrolling_down,
        ['<C-f>'] = actions.preview_scrolling_up,
        ['<C-b>'] = actions.preview_scrolling_down,
      },
      i = {
        ['<C-u>'] = actions.results_scrolling_up,
        ['<C-d>'] = actions.results_scrolling_down,
        ['<C-f>'] = actions.preview_scrolling_up,
        ['<C-b>'] = actions.preview_scrolling_down,
      }
    },
    layout_config = {
      flex = {
        horizontal = {
          preview_width = 0.65,
        },
        flip_columns = 150,
        width = 0.65,
        height = 0.8,
        anchor = 'c',
      }
    },
  },
  pickers = {
    find_files = {
      layout_strategy = 'flex'
    },
    buffers = {
      theme = 'ivy',
      layout_config = {
        height = 16,
        preview_width = 0.60
      }
    },
    lsp_references = {
      theme = 'dropdown',
      layout_config = {
        width = 0.65,
        height = 0.35,
        anchor = 's',
      }
    },
    lsp_workspace_symbols = {
      theme = 'dropdown',
      layout_config = {
        width = 0.65,
        height = 0.35,
        anchor = 's',
      }
    },
  },
  extensions = {
    -- ...
  }
}
