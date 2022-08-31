-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- local function vmap(lhs, rhs, opts) map('v', lhs, rhs, opts) end
local function nmap(lhs, rhs, opts) map('n', lhs, rhs, opts) end
local function imap(lhs, rhs, opts) map('i', lhs, rhs, opts) end
local function cmap(lhs, rhs, opts) map('c', lhs, rhs, opts) end

-- space as (global) leader key
vim.g.mapleader = " "
nmap('<space>', '<nop>')

-- navigate wrapped lines more easily
nmap('j', 'gj')
nmap('k', 'gk')

-- rapidly abort
imap('kj', '<esc>')
cmap('kj', '<C-C>')

-- window navigation
nmap('<c-h>', '<c-w>h')
nmap('<c-j>', '<c-w>j')
nmap('<c-k>', '<c-w>k')
nmap('<c-l>', '<c-w>l')

-- using netrw as a filedrawer
nmap('<leader>ee', '<cmd> Lexplore 15 <cr>')
nmap('<leader>>', ':exe "vertical resize " . (winwidth(0) * 5/4)<cr>')
nmap('<leader><', ':exe "vertical resize " . (winwidth(0) * 4/5)<cr>')
nmap('<leader>+', ':exe "resize " . (winheight(0) * 5/4)<cr>')
nmap('<leader>-', ':exe "resize " . (winheight(0) * 4/5)<cr>')

nmap('<leader>cd', '<cmd> cd %:h <cr> <cmd> pwd <cr>')

nmap('<leader>mm', '<cmd> Mason <cr>')
nmap('<leader>pp', '<cmd> LspInfo <cr>')

nmap('<leader>xx', '<cmd> TroubleToggle <cr>')
nmap('<leader>xw', '<cmd> TroubleToggle workspace_diagnostics <cr>')
nmap('<leader>xd', '<cmd> TroubleToggle document_diagnostics <cr>')
nmap('<leader>xq', '<cmd> TroubleToggle quickfix <cr>')
nmap('<leader>xl', '<cmd> TroubleToggle loclist <cr>')
nmap('<leader>xr', '<Cmd> TroubleToggle lsp_references <cr>')

return nmap
