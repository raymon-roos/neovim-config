local mappers = require('core.keymapper')

local map = mappers.map
local nmap = mappers.nmap
local vmap = mappers.vmap
local cmap = mappers.cmap
local imap = mappers.imap
local tmap = mappers.tmap

-- space as (global) leader key
vim.g.mapleader = ' '
map({ 'n', 'v' }, '<space>', '<nop>')

-- navigate wrapped lines more easily
nmap('j', 'gj')
nmap('k', 'gk')

nmap('<leader>F', function () require('conform').format({ lsp_fallback = true }) end)
nmap('<leader>fm', function () require('conform').format({ lsp_fallback = true }) end)

-- "drag" lines up and down
nmap('<S-A-j>', '<CMD> move .+1 <CR>')
nmap('<S-A-k>', '<CMD> move .-2 <CR>')
vmap('<S-A-j>', ": '<,'>move '>+1 <CR> gvgv")
vmap('<S-A-k>', ": '<,'>move '<-2 <CR> gvgv")

-- Swap arguments
local iswap = require('iswap')
nmap('<leader>a', function() iswap.iswap_with() end)
nmap('<leader>ga', function() iswap.iswap() end)
nmap('<leader>gA', function() iswap.iswap_node() end)

-- insert empty line
nmap('<leader>o', function() vim.fn.append(vim.fn.line('.'), '') end)
nmap('<leader>O', function() vim.fn.append(vim.fn.line('.') - 1, '') end)

-- Apend semicolon or comma at the end of the line without moving cursor
imap('<A-;>', '<C-o>mo<C-o>A;<C-o>`o<C-o><CMD>delmarks o<CR>')
imap('<A-,>', '<C-o>mo<C-o>A,<C-o>`o<C-o><CMD>delmarks o<CR>')
nmap('<A-;>', 'mo A;<ESC>`o <CMD>delmarks o<CR>')
nmap('<C-,>', 'mo A,<ESC>`o <CMD>delmarks o<CR>')

-- using alt as a modifier for window and buffer navigation

-- window navigation, alt+n/e/i/o to move to another window
map({ 'n', 't' }, '<A-n>', '<C-\\><C-N><C-w>h')
map({ 'n', 't' }, '<A-e>', '<C-\\><C-N><C-w>j')
map({ 'n', 't' }, '<A-i>', '<C-\\><C-N><C-w>k')
map({ 'n', 't' }, '<A-o>', '<C-\\><C-N><C-w>l')
map({ 'n', 't' }, '<A-Left>', '<C-\\><C-N><C-w>h')
map({ 'n', 't' }, '<A-Down>', '<C-\\><C-N><C-w>j')
map({ 'n', 't' }, '<A-Up>', '<C-\\><C-N><C-w>k')
map({ 'n', 't' }, '<A-Right>', '<C-\\><C-N><C-w>l')
map({ 'n', 't' }, '<A-S-n>', '<C-\\><C-N><C-w>H')
map({ 'n', 't' }, '<A-S-e>', '<C-\\><C-N><C-w>J')
map({ 'n', 't' }, '<A-S-i>', '<C-\\><C-N><C-w>K')
map({ 'n', 't' }, '<A-S-o>', '<C-\\><C-N><C-w>L')

-- resizing windows (plus/minus and lesser/greater than, but without shift modifier)
nmap('<A-.>', '<CMD> vertical resize +7 <CR>')
nmap('<A-,>', '<CMD> vertical resize -7 <CR>')
nmap('<A-=>', '<CMD> resize +3 <CR>')
nmap('<A-->', '<CMD> resize -3 <CR>')

-- control buffers
nmap('<leader>bl', '<CMD>ls<CR>')
nmap('<leader>bd', '<CMD>bd<CR>')
nmap('<leader>bD', '<CMD>bd!<CR>')
nmap('<leader>bo', '<CMD>wall | %bd | e#<CR>')
nmap('<leader>bad', '<CMD>%bd<CR>')
nmap('<C-s>', '<CMD>update<CR>') -- Cheeky little crtl+s bind
nmap('<leader>bw', '<CMD>update<CR>')
nmap('<leader>bW', '<CMD>update!<CR>')
nmap('<leader>bp', '<CMD>echo expand("%:p")<CR>')

-- spawn a terminal
map({ 'n', 't' }, '<leader>T', '<CMD> vsplit | terminal <CR>')
map({ 'n', 't' }, '<leader>Tg', '<CMD> vsplit | terminal gitui <CR>')

-- use escape in terminal window like we're used to
tmap('<Esc>', '<C-\\><C-n>')

-- Open Oil file explorer
nmap('<leader>e', function () require('oil').open() end)
nmap('<leader>E', function () require('oil').toggle_float() end)

-- switch working dir to directory of current file
nmap('<leader>cd', '<CMD> cd %:h <CR> <CMD> pwd <CR>')

-- Temporarily hide diagnostics
nmap('<leader>dd', vim.diagnostic.hide)

-- Telescope. 'f' for find
local telescope = require('telescope.builtin')
nmap('<leader>ff', telescope.find_files)
nmap('<leader>FF', function() telescope.find_files({ no_ignore = true }) end)
nmap('<leader>fo', telescope.oldfiles)
nmap('<leader>fg', telescope.current_buffer_fuzzy_find)
nmap('<leader>fG', telescope.live_grep)
nmap('<leader>fb', telescope.buffers)
nmap('<leader>fh', telescope.help_tags)
nmap('<leader>ft', telescope.tags)
nmap('<leader>fc', telescope.command_history)
nmap('<leader>fp', telescope.registers)
nmap('<leader>fr', telescope.lsp_references)
nmap('<leader>fd', telescope.diagnostics)
nmap('<leader>fw', telescope.lsp_document_symbols)
nmap('<leader>fW', telescope.lsp_dynamic_workspace_symbols)
nmap('<leader>fR', telescope.resume)
nmap('<leader>fq', telescope.quickfix)
nmap('<leader>fQ', telescope.quickfixhistory)

-- easily open windows of relevant plugins
nmap('<leader>mm', '<CMD> Mason <CR>')
nmap('<leader>pp', '<CMD> LspInfo <CR>')
nmap('<leader>ns', '<CMD> NullLsInfo <CR>')
nmap('<leader>ps', '<CMD> PackerSync <CR>')
nmap('<leader>PS', '<CMD> PackerStatus <CR>')

-- control builtin spell Checking
nmap('<leader>ss', '<CMD> setlocal spell! <CR>')                   -- toggle spell checking
nmap('<leader>sb', '<CMD> setlocal spell spelllang=en_gb,nl <CR>') -- turn on English + Dutch
nmap('<leader>se', '<CMD> setlocal spell spelllang=en_gb <CR>')    -- turn on just Brittish English
nmap('<leader>sn', '<CMD> setlocal spell spelllang=nl <CR>')       -- turn on just Dutch
nmap('<leader>fs', telescope.spell_suggest)

-- Change all double quotes to single quotes in selected lines
nmap('<leader>qD', '<CMD> %s#\'#"#ge <CR>') --mnemonic: quotes -> double
nmap('<leader>qS', '<CMD> %s#"#\'#ge <CR>') --mnemonic: quotes -> single
vmap('<leader>qs', '<CMD> s#"#\'#ge <CR>')
vmap('<leader>qd', '<CMD> s#\'#"#ge <CR>')

-- Quickfix
nmap('<leader>qq', '<CMD> copen <CR>')
nmap('<leader>qn', '<CMD> cnext <CR>')
nmap('<leader>qp', '<CMD> cprev <CR>')
nmap('<leader>qr', '<CMD> crewind <CR>')

-- Test runner
local neotest = require('neotest')
nmap('<leader>tt', function() neotest.run.run() end)
nmap('<leader>tf', function() neotest.run.run(vim.fn.expand('%')) end)
nmap('<leader>ts', function() neotest.summary.toggle() end)
nmap('<leader>to', function() neotest.output.open({ quiet = true, short = true, auto_close = true, }) end)
nmap('<leader>tO', function() neotest.output_panel.toggle() end)
nmap('<leader>tw', function() neotest.watch.toggle() end)
