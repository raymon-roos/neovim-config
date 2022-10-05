local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { '*.xml', '*.html', '*.xhtml', '*.css', '*.scss', '*.javascript', '*.js', '*.json', '*.typescript', '*.ts', '*.yaml', '*.lua', '*.vim' },
  command = 'setlocal softtabstop=2 shiftwidth=2 expandtab'
})

-- Set spell checking and prose formatting 
augroup('setProse', { clear = true })
autocmd('Filetype', {
  group = 'setProse',
  pattern = { '*.tex', '*.md' },
  command = 'setlocal textwidth=90 fo+=atcrqn1'
  -- callback = function (args)
  --   vim.bo[args.buf].textwidth = 90
  --   vim.bo[args.buf].fo:append('atcrqn1')
  -- end
})

-- Auto-recompile after changing packer's plugin file 
augroup('packerConfig', { clear = true })
autocmd('BufWritePost', {
  group = 'packerConfig',
  pattern = '*packer/init.lua',
  command = 'source <afile> | PackerCompile'
})

-- Auto source after changing nvim settings
augroup('nvimOpts', { clear = true })
autocmd('BufWritePost', {
  group = 'nvimOpts',
  pattern = 'core/options.lua',
  command = 'source <afile>'
})
