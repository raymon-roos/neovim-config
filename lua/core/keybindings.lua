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
map({ 'n', 'v', 't' }, '<leader>T', '<CMD> vsplit | terminal <CR>')
map({ 'n', 'v', 't' }, '<leader>Tg', '<CMD> vsplit | terminal gitui <CR>')


-- resizing windows (plus/minus and lesser/greater than, but without shift modifier)
nmap('<A-.>', ':exe "vertical resize " . (winwidth(0) * 7/6)<CR>')
nmap('<A-,>', ':exe "vertical resize " . (winwidth(0) * 5/6)<CR>')
nmap('<A-=>', ':exe "resize " . (winheight(0) * 7/6)<CR>')
nmap('<A-->', ':exe "resize " . (winheight(0) * 5/6)<CR>')

-- control buffers
nmap("<leader>bl", "<CMD>ls<CR>")
nmap("<leader>bd", "<CMD>bd<CR>")
nmap("<leader>bD", "<CMD>bd!<CR>")
nmap("<leader>bo", "<CMD>wall | %bd | e#<CR>")
nmap("<leader>bad", "<CMD>%bd<CR>")
nmap("<C-s>", "<CMD>update<CR>") -- Cheeky little crtl+s bind
nmap("<leader>bw", "<CMD>update<CR>")
nmap("<leader>bW", "<CMD>update!<CR>")

-- use escape in terminal window like we're used to
tmap('<Esc>', '<C-\\><C-n>')

-- using netrw as a filedrawer
nmap('<leader>ee', '<CMD> Lexplore 15 <CR>')

-- switch working dir to directory of current file
nmap('<leader>cd', '<CMD> cd %:h <CR> <CMD> pwd <CR>')

-- easily open windows of relevant plugins
nmap('<leader>mm', '<CMD> Mason <CR>')
nmap('<leader>pp', '<CMD> LspInfo <CR>')
nmap('<leader>ns', '<CMD> NullLsInfo <CR>')
nmap('<leader>ps', '<CMD> PackerStatus <CR>')

-- control builtin spell Checking
nmap('<leader>ss', '<CMD> setlocal spell! <CR>') -- toggle spell checking
nmap('<leader>sb', '<CMD> setlocal spell spelllang=en_gb,nl <CR>') -- turn on English + Dutch
nmap('<leader>se', '<CMD> setlocal spell spelllang=en_gb <CR>') -- turn on just Brittish English
nmap('<leader>sn', '<CMD> setlocal spell spelllang=nl <CR>') -- turn on just Dutch
