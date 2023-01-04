local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '800' })
  end
})

-- Auto source after changing nvim settings
augroup('nvimOpts', { clear = true })
autocmd('BufWritePost', {
  group = 'nvimOpts',
  pattern = 'core/options.lua',
  command = 'source <afile>'
})

-- Change settings for writing emails
augroup('nvimMail', { clear = true })
autocmd('BufReadPost', {
  group = 'nvimOpts',
  pattern = '/tmp/neomutt-*',
  callback = function()
    vim.bo.textwidth = 72
    vim.wo.spell = true
    vim.bo.spelllang = 'en_gb,nl'
  end
})
