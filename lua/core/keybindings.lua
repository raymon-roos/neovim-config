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

-- "drag" lines up and down
nmap('<S-A-j>', '<CMD> move .+1 <CR>')
nmap('<S-A-k>', '<CMD> move .-2 <CR>')
vmap('<S-A-j>', ": '<,'>move '>+1 <CR> gvgv")
vmap('<S-A-k>', ": '<,'>move '<-2 <CR> gvgv")

-- insert empty line
nmap('<leader>o', function() vim.fn.append(vim.fn.line('.'), '') end)
nmap('<leader>O', function() vim.fn.append(vim.fn.line('.') - 1, '') end)

-- rapidly abort
imap('kj', '<esc>')
cmap('kj', '<C-c>')

-- using alt as a modifier for window and buffer navigation

-- quickly set and switch between some marks
nmap('<C-A-o>', '<CMD> mark O <CR>')
nmap('<C-A-i>', '<CMD> mark I <CR>')
nmap('<C-A-u>', '<CMD> mark U <CR>')
nmap('<A-o>', '`O zz')
nmap('<A-i>', '`I zz')
nmap('<A-u>', '`U zz')

-- window navigation, alt+h/j/k/l to move to another window
map({ 'n', 'v', 'i', 't' }, '<A-h>', '<C-\\><C-N><C-w>h')
map({ 'n', 'v', 'i', 't' }, '<A-j>', '<C-\\><C-N><C-w>j')
map({ 'n', 'v', 'i', 't' }, '<A-k>', '<C-\\><C-N><C-w>k')
map({ 'n', 'v', 'i', 't' }, '<A-l>', '<C-\\><C-N><C-w>l')

-- resizing windows (plus/minus and lesser/greater than, but without shift modifier)
nmap('<A-.>', '<CMD> vertical resize +7 <CR>')
nmap('<A-,>', '<CMD> vertical resize -7 <CR>')
nmap('<A-=>', '<CMD> resize +3 <CR>')
nmap('<A-->', '<CMD> resize -3 <CR>')

-- control buffers
nmap("<leader>bl", "<CMD>ls<CR>")
nmap("<leader>bd", "<CMD>bd<CR>")
nmap("<leader>bD", "<CMD>bd!<CR>")
nmap("<leader>bo", "<CMD>wall | %bd | e#<CR>")
nmap("<leader>bad", "<CMD>%bd<CR>")
nmap("<C-s>", "<CMD>update<CR>") -- Cheeky little crtl+s bind
nmap("<leader>bw", "<CMD>update<CR>")
nmap("<leader>bW", "<CMD>update!<CR>")
nmap("<leader>bp", "<CMD>echo expand('%:p')<CR>")

-- spawn a terminal
map({ 'n', 't' }, '<leader>T', '<CMD> vsplit | terminal <CR>')
map({ 'n', 't' }, '<leader>Tg', '<CMD> vsplit | terminal gitui <CR>')

-- use escape in terminal window like we're used to
tmap('<Esc>', '<C-\\><C-n>')

-- using netrw as a filedrawer
nmap('<leader>ee', '<CMD> Lexplore 15 <CR>')

nmap('<leader>hh', ':vertical help', { silent = false })

-- switch working dir to directory of current file
nmap('<leader>cd', '<CMD> cd %:h <CR> <CMD> pwd <CR>')

-- Telescope. 'f' for find
local telescope = require('telescope.builtin')
nmap('<leader>ff', telescope.find_files)
nmap('<leader>fo', telescope.oldfiles)
nmap('<leader>fg', telescope.current_buffer_fuzzy_find)
nmap('<leader>fG', telescope.live_grep)
nmap('<leader>fb', telescope.buffers)
nmap('<leader>fh', telescope.help_tags)
nmap('<leader>fc', telescope.command_history)
nmap('<leader>fp', telescope.registers)
nmap('<leader>fP', '<CMD> Telescope neoclip layout_strategy=flex<CR>')
nmap('<leader>fr', telescope.lsp_references)
nmap('<leader>fw', telescope.lsp_document_symbols)
nmap('<leader>fW', telescope.lsp_dynamic_workspace_symbols)
nmap('<leader>fR', telescope.resume)
nmap('<leader>fu', '<CMD> Telescope undo layout_strategy=flex<CR>')

-- easily open windows of relevant plugins
nmap('<leader>mm', '<CMD> Mason <CR>')
nmap('<leader>pp', '<CMD> LspInfo <CR>')
nmap('<leader>ns', '<CMD> NullLsInfo <CR>')
nmap('<leader>ps', '<CMD> PackerStatus <CR>')

-- control builtin spell Checking
nmap('<leader>ss', '<CMD> setlocal spell! <CR>')                   -- toggle spell checking
nmap('<leader>sb', '<CMD> setlocal spell spelllang=en_gb,nl <CR>') -- turn on English + Dutch
nmap('<leader>se', '<CMD> setlocal spell spelllang=en_gb <CR>')    -- turn on just Brittish English
nmap('<leader>sn', '<CMD> setlocal spell spelllang=nl <CR>')       -- turn on just Dutch
nmap('<leader>fs', telescope.spell_suggest)

-- Change all double quotes to single quotes in selected lines
nmap('<leader>qD', '<CMD> %s#\'#"#g <CR>') --mnemonic: quotes -> single
nmap('<leader>qS', '<CMD> %s#"#\'#g <CR>') --mnemonic: quotes -> double
vmap('<leader>qs', '<CMD> s#"#\'#g <CR>')
vmap('<leader>qd', '<CMD> s#\'#"#g <CR>')
