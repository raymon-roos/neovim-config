-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- local function vmap(lhs, rhs, opts) map('v', lhs, rhs, opts) end
local function nmap(lhs, rhs, opts) map('n', lhs, rhs, opts) end
local function imap(lhs, rhs, opts) map('i', lhs, rhs, opts) end
local function cmap(lhs, rhs, opts) map('i', lhs, rhs, opts) end

-- space as (global) leader key
vim.g.mapleader = " "
nmap('<Space>', '<Nop>')

-- navigate wrapped lines more easily
nmap('j', 'gj')
nmap('k', 'gk')

-- rapidly abort
imap('kj', '<esc>')
cmap('kj', '<C-C>')

-- window navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- using netrw as a filedrawer
nmap('<leader>ee', ':exe "Lexplore 15" <CR>', { '<silent>' } )
nmap('<leader>>', ':exe "vertical resize " . (winwidth(0) * 5/4)<CR>')
nmap('<leader><', ':exe "vertical resize " . (winwidth(0) * 4/5)<CR>')
nmap('<leader>+', ':exe "resize " . (winheight(0) * 5/4)<CR>')
nmap('<leader>-', ':exe "resize " . (winheight(0) * 4/5)<CR>')


