local mappers = require('core.keymapper')

local map = mappers.map
local nmap = mappers.nmap
local vmap = mappers.vmap
local cmap = mappers.cmap
local imap = mappers.imap
local tmap = mappers.tmap

-- space as (global) leader key
vim.g.mapleader = " "
map({ 'n', 'v' }, '<space>', '<nop>')

nmap('<leader>hh', ':vertical help', { silent = false })

-- navigate wrapped lines more easily
nmap('j', 'gj')
nmap('k', 'gk')

-- rapidly abort
imap('kj', '<esc>')
cmap('kj', '<C-c>')

-- window navigation, in terminal/normal/insert/visual modes
-- using alt for all window operations
map({ 'n', 'v', 'i', 't' }, '<A-h>', '<C-\\><C-N><C-w>h')
map({ 'n', 'v', 'i', 't' }, '<A-j>', '<C-\\><C-N><C-w>j')
map({ 'n', 'v', 'i', 't' }, '<A-k>', '<C-\\><C-N><C-w>k')
map({ 'n', 'v', 'i', 't' }, '<A-l>', '<C-\\><C-N><C-w>l')
-- spawn a terminal
map({ 'n', 'v', 't' }, '<leader>T', '<cmd> vsplit | terminal <cr>')
map({ 'n', 'v', 't' }, '<leader>Tg', '<cmd> vsplit | terminal gitui <cr>')

map({ 'n', 'v', 'i', 't' }, '<A-h>', '<C-\\><C-N><C-w>h')

-- resizing windows (plus/minus and lesser/greater than, but without shift modifier)
nmap('<A-.>', ':exe "vertical resize " . (winwidth(0) * 7/6)<cr>')
nmap('<A-,>', ':exe "vertical resize " . (winwidth(0) * 5/6)<cr>')
nmap('<A-=>', ':exe "resize " . (winheight(0) * 7/6)<cr>')
nmap('<A-->', ':exe "resize " . (winheight(0) * 5/6)<cr>')

-- control buffers
nmap("<leader>bl", "<cmd>ls<CR>")
nmap("<leader>bd", "<cmd>bd<CR>")
nmap("<leader>bD", "<cmd>bd!<CR>")
nmap("<leader>bo", "<cmd>wall | %bd | e#<CR>")
nmap("<leader>bad", "<cmd>%bd<CR>")
nmap("<C-s>", "<cmd>update<CR>") -- Cheeky little crtl+s bind
nmap("<leader>bw", "<cmd>update<CR>")
nmap("<leader>bW", "<cmd>update!<CR>")

-- use escape in terminal window like we're used to
tmap('<Esc>', '<C-\\><C-n>')

-- using netrw as a filedrawer
nmap('<leader>ee', '<cmd> Lexplore 15 <cr>')

-- switch working dir to directory of current file
nmap('<leader>cd', '<cmd> cd %:h <cr> <cmd> pwd <cr>')

-- easily open windows of relevant plugins
nmap('<leader>mm', '<cmd> Mason <cr>')
nmap('<leader>pp', '<cmd> LspInfo <cr>')
nmap('<leader>ps', '<cmd> PackerStatus <cr>')

-- control builtin spell Checking
nmap('<leader>ss', '<cmd> setlocal spell! <cr>') -- toggle spell checking
nmap('<leader>sb', '<cmd> setlocal spell spelllang=en,nl <cr>') -- turn on English + Dutch
nmap('<leader>se', '<cmd> setlocal spell spelllang=en_gb <cr>') -- turn on just Brittish English
nmap('<leader>sn', '<cmd> setlocal spell spelllang=nl <cr>') -- turn on just Dutch

