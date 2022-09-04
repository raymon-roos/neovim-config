-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function vmap(lhs, rhs, opts) map('v', lhs, rhs, opts) end
local function nmap(lhs, rhs, opts) map('n', lhs, rhs, opts) end
local function imap(lhs, rhs, opts) map('i', lhs, rhs, opts) end
local function cmap(lhs, rhs, opts) map('c', lhs, rhs, opts) end
local function tmap(lhs, rhs, opts) map('t', lhs, rhs, opts) end

-- space as (global) leader key
vim.g.mapleader = " "
nmap('<space>', '<nop>')

-- navigate wrapped lines more easily
nmap('j', 'gj')
nmap('k', 'gk')

-- rapidly abort
imap('kj', '<esc>')
cmap('kj', '<c-c>')

-- window navigation, in terminal/normal/insert/visual modes 
-- using alt for all window operations
tmap('<a-h>', '<c-\\><C-N><C-w>h')
tmap('<a-j>', '<c-\\><C-N><C-w>j')
tmap('<a-k>', '<c-\\><C-N><C-w>k')
tmap('<a-l>', '<c-\\><C-N><C-w>l')

imap('<a-h>', '<c-\\><C-N><C-w>h')
imap('<a-j>', '<c-\\><C-N><C-w>j')
imap('<a-k>', '<c-\\><C-N><C-w>k')
imap('<a-l>', '<c-\\><C-N><C-w>l')

nmap('<a-h>', '<c-w>h')
nmap('<a-j>', '<c-w>j')
nmap('<a-k>', '<c-w>k')
nmap('<a-l>', '<c-w>l')

vmap('<a-h>', '<c-w>h')
vmap('<a-j>', '<c-w>j')
vmap('<a-k>', '<c-w>k')
vmap('<a-l>', '<c-w>l')

-- resizing windows (plus/minus and lesser/greater than, but without shift modifier)
nmap('<a-.>', ':exe "vertical resize " . (winwidth(0) * 5/4)<cr>')
nmap('<a-,>', ':exe "vertical resize " . (winwidth(0) * 4/5)<cr>')
nmap('<a-=>', ':exe "resize " . (winheight(0) * 5/4)<cr>')
nmap('<a-->', ':exe "resize " . (winheight(0) * 4/5)<cr>')

-- use escape in terminal window like we're used to
tmap('<Esc>', '<C-\\><C-n>')

-- using netrw as a filedrawer
nmap('<a-e>', '<cmd> Lexplore 15 <cr>')

-- switch working dir to directory of current file
nmap('<leader>cd', '<cmd> cd %:h <cr> <cmd> pwd <cr>')

-- easily open windows of relevant plugins
nmap('<leader>mm', '<cmd> Mason <cr>')
nmap('<leader>pp', '<cmd> LspInfo <cr>')
nmap('<leader>ps', '<cmd> PackerStatus <cr>')

-- control the diagnostics window
nmap('<leader>xx', '<cmd> TroubleToggle <cr>')
nmap('<leader>xw', '<cmd> TroubleToggle workspace_diagnostics <cr>')
nmap('<leader>xd', '<cmd> TroubleToggle document_diagnostics <cr>')
nmap('<leader>xq', '<cmd> TroubleToggle quickfix <cr>')
nmap('<leader>xl', '<cmd> TroubleToggle loclist <cr>')
nmap('<leader>xr', '<Cmd> TroubleToggle lsp_references <cr>')

-- control builtin spell Checking
nmap('<leader>sb', '<cmd> setlocal spell spelllang=en,nl <cr>') -- turn on English + Dutch
nmap('<leader>se', '<cmd> setlocal spell spelllang=en_gb <cr>') -- turn on just Brittish English
nmap('<leader>sn', '<cmd> setlocal spell spelllang=nl <cr>') -- turn on just Dutch
nmap('<leader>ss', '<cmd> setlocal spell! <cr>') -- turn on just Brittish English

return nmap
