local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '800' })
  end,
})

-- Auto source after changing nvim settings
-- augroup('nvimOpts', { clear = true })
-- autocmd('BufWritePost', {
--   group = 'nvimOpts',
--   pattern = vim.fn.stdpath('config') .. '**/*.lua',
--   command = 'source <afile>'
-- })

-- set highlights after colorscheme
augroup('highlights', { clear = true })
autocmd('ColorScheme', {
  group = 'highlights',
  pattern = '*',
  callback = function()
    -- The below settings tweak Leap's default target highlighting.
    -- Has the adventage of giving imediate visual feedback when the
    -- leap key is triggered, and making targets more clearly visible.

    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })

    vim.api.nvim_set_hl(0, 'LeapMatch', {
      fg = 'red',
      bg = 'black',
      nocombine = true,
    })

    vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
      fg = 'yellow',
      bg = 'black',
      nocombine = true,
    })

    vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
      fg = 'blue',
      bg = 'black',
      nocombine = true,
    })
  end,
})

augroup('IncSearchHighlight', { clear = true })
autocmd('CmdlineEnter', {
  group = 'IncSearchHighlight',
  pattern = '/,\\?',
  command = [[ :set hlsearch ]],
})
autocmd('CmdlineLeave', {
  group = 'IncSearchHighlight',
  pattern = '/,\\?',
  command = [[ :set nohlsearch ]],
})
