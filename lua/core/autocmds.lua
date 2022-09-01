local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

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
  command = 'setlocal softtabstop=2 shiftwidth=2'
})

-- Set spell checking and prose formatting 
augroup('setProse', { clear = true })
autocmd('Filetype', {
  group = 'setProse',
  pattern = { '*.tex', '*.md' },
  command = 'setlocal spell spelllang=en,nl textwidth=90 fo=tcrqn1'
})
autocmd('Filetype', {
  group = 'setProse',
  pattern = { '*.md' },
  command = 'setlocal fo=atcrqn1'
})

-- Auto-recompile after changing packer's plugin file 
augroup('packer_config', { clear = true })
autocmd('BufWritePost', {
  group = 'packer_config',
  pattern = '*packer/init.lua',
  command = 'source <afile> | PackerCompile'
})

