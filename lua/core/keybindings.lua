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
cmap('kj', '<C-C>')

-- window navigation, in terminal/normal/insert/visual modes
tmap('<A-h>', '<C-\\><C-N><C-w>h')
tmap('<A-j>', '<C-\\><C-N><C-w>j')
tmap('<A-k>', '<C-\\><C-N><C-w>k')
tmap('<A-l>', '<C-\\><C-N><C-w>l')

imap('<A-h>', '<C-\\><C-N><C-w>h')
imap('<A-j>', '<C-\\><C-N><C-w>j')
imap('<A-k>', '<C-\\><C-N><C-w>k')
imap('<A-l>', '<C-\\><C-N><C-w>l')

nmap('<A-h>', '<C-w>h')
nmap('<A-j>', '<C-w>j')
nmap('<A-k>', '<C-w>k')
nmap('<A-l>', '<C-w>l')

vmap('<A-h>', '<C-w>h')
vmap('<A-j>', '<C-w>j')
vmap('<A-k>', '<C-w>k')
vmap('<A-l>', '<C-w>l')

-- use escape in terminal window like we're used to
tmap('<Esc>', '<C-\\><C-n>')

-- using netrw as a filedrawer
nmap('<leader>ee', '<cmd> Lexplore 15 <cr>')
nmap('<leader>>', ':exe "vertical resize " . (winwidth(0) * 5/4)<cr>')
nmap('<leader><', ':exe "vertical resize " . (winwidth(0) * 4/5)<cr>')
nmap('<leader>+', ':exe "resize " . (winheight(0) * 5/4)<cr>')
nmap('<leader>-', ':exe "resize " . (winheight(0) * 4/5)<cr>')

-- switch working dir to directory of current file
nmap('<leader>cd', '<cmd> cd %:h <cr> <cmd> pwd <cr>')

-- easily open windows of relevant plugins
nmap('<leader>mm', '<cmd> Mason <cr>')
nmap('<leader>pp', '<cmd> LspInfo <cr>')

-- controll the diagnostics window
nmap('<leader>xx', '<cmd> TroubleToggle <cr>')
nmap('<leader>xw', '<cmd> TroubleToggle workspace_diagnostics <cr>')
nmap('<leader>xd', '<cmd> TroubleToggle document_diagnostics <cr>')
nmap('<leader>xq', '<cmd> TroubleToggle quickfix <cr>')
nmap('<leader>xl', '<cmd> TroubleToggle loclist <cr>')
nmap('<leader>xr', '<Cmd> TroubleToggle lsp_references <cr>')

return nmap
