return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
  dependencies = 'nvim-treesitter',
  opts = {
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['if'] = '@function.inner',
          ['af'] = '@function.outer',
          ['iC'] = '@class.inner',
          ['aC'] = '@class.outer',
          ['as'] = '@scope',
          ['il'] = '@loop.inner',
          ['al'] = '@loop.outer',
          ['ii'] = '@conditional.inner',
          ['ai'] = '@conditional.outer',
        },
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ['@parameter.outer'] = 'v',
          ['@function.outer'] = 'v',
          ['@class.outer'] = 'V',
          ['@scope'] = '<c-v>',
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = false,
      },
      swap = {
        enable = false,
        swap_next = {
          ['<leader>s'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>S'] = '@parameter.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer' },
        goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer' },
        goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer' },
        goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer' },
        goto_next = {
          [']i'] = '@conditional.outer',
          [']l'] = '@loop.outer',
        },
        goto_previous = {
          ['[i'] = '@conditional.outer',
          ['[l'] = '@loop.outer',
        },
      },
      lsp_interop = {
        enable = true,
        border = 'rounded',
        peek_definition_code = {
          ['<leader>tf'] = '@function.outer',
          ['<leader>tF'] = '@class.outer',
        },
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
