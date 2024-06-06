local mappers = require('utils.keymapper')

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
map({ 'n', 'v' }, '<Down>', function() return vim.v.count == 0 and 'g<Down>' or '<Down>' end, { expr = true })
map({ 'n', 'v' }, '<Up>', function() return vim.v.count == 0 and 'g<Up>' or '<Up>' end, { expr = true })

nmap('<leader>F', function() require('conform').format({ lsp_fallback = true }) end)
nmap('<leader>fm', function() require('conform').format({ lsp_fallback = true }) end)

-- "drag" lines up and down
nmap('<S-A-j>', '<CMD> move .+1 <CR>')
nmap('<S-A-k>', '<CMD> move .-2 <CR>')
vmap('<S-A-j>', ": '<,'>move '>+1 <CR> gvgv")
vmap('<S-A-k>', ": '<,'>move '<-2 <CR> gvgv")

-- Swap arguments
nmap('<leader>a', function() require('iswap').iswap_with() end)
nmap('<leader>ga', function() require('iswap').iswap() end)
nmap('<leader>gA', function() require('iswap').iswap_node() end)

-- insert empty line
nmap('<leader>o', function() vim.fn.append(vim.fn.line('.'), '') end)
nmap('<leader>O', function() vim.fn.append(vim.fn.line('.') - 1, '') end)

-- :help undo-break
imap('.', '<C-g>u.')
imap(',', '<C-g>u,')
imap(';', '<C-g>u;')

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

nmap('<C-Down>', '2<C-e>')
nmap('<C-Up>', '2<C-y>')

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

-- navigating tabs, browser style
nmap('<A-Tab>', 'gt')
nmap('<S-Tab>', 'gT')
for i = 1, 9 do
  nmap(string.format('<A-%s>', i), string.format('<cmd>%stabnext<cr>', i))
end

-- spawn a terminal
map({ 'n', 't' }, '<leader>T', '<CMD> vsplit | terminal <CR>')
map({ 'n', 't' }, '<leader>Tg', '<CMD> vsplit | terminal gitui <CR>')

-- use escape in terminal window like we're used to
tmap('<Esc>', '<C-\\><C-n>')

-- Open Oil file explorer
nmap('<leader>e', function() require('oil').open() end)
nmap('<leader>E', function() require('oil').toggle_float() end)

-- switch working dir to directory of current file
nmap('<leader>cd', '<CMD> cd %:h <CR> <CMD> pwd <CR>')

-- Toggle diagnostic virtual text
nmap('<leader>dd', function()
    local current_value = vim.diagnostic.config().virtual_text
    if current_value then
      vim.diagnostic.config({ virtual_text = false })
    else
      vim.diagnostic.config({ virtual_text = true })
    end
  end,
  {}
)

-- Telescope. 'f' for find
nmap('<leader>ff', function() require('telescope.builtin').find_files() end)
nmap('<leader>FF', function() require('telescope.builtin').find_files({ no_ignore = true }) end)
nmap('<leader>fe', function()
  require('oil')
  require('telescope.builtin').find_files({
    find_command = { 'fd', '-td' },
    follow = true,
  })
end)
nmap('<leader>fo', function() require('telescope.builtin').oldfiles() end)
nmap('<leader>fg', function() require('telescope.builtin').current_buffer_fuzzy_find() end)
nmap('<leader>fG', function() require('telescope.builtin').live_grep() end)
nmap('<leader>fb', function()
  require('telescope.builtin').buffers({ ignore_current_buffer = true, sort_mru = true, })
end)
nmap('<leader>fh', function() require('telescope.builtin').help_tags() end)
nmap('<leader>ft', function() require('telescope.builtin').tags() end)
nmap('<leader>fc', function() require('telescope.builtin').command_history() end)
nmap('<leader>fp', function() require('telescope.builtin').registers() end)
nmap('<leader>fr', function() require('telescope.builtin').lsp_references() end)
nmap('<leader>fd', function() require('telescope.builtin').diagnostics() end)
nmap('<leader>fw', function() require('telescope.builtin').lsp_document_symbols() end)
nmap('<leader>fW', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end)
nmap('<leader>fR', function() require('telescope.builtin').resume() end)
nmap('<leader>fq', function() require('telescope.builtin').quickfix() end)
nmap('<leader>fQ', function() require('telescope.builtin').quickfixhistory() end)

-- easily open windows of relevant plugins
nmap('<leader>mm', '<CMD> Mason <CR>')
nmap('<leader>pp', '<CMD> LspInfo <CR>')
nmap('<leader>ns', '<CMD> NullLsInfo <CR>')
nmap('<leader>ll', '<CMD> Lazy home <CR>')
nmap('<leader>ls', '<CMD> Lazy sync <CR>')

-- control builtin spell Checking
nmap('<leader>ss', '<CMD> setlocal spell! <CR>')                   -- toggle spell checking
nmap('<leader>sb', '<CMD> setlocal spell spelllang=en_gb,nl <CR>') -- turn on English + Dutch
nmap('<leader>se', '<CMD> setlocal spell spelllang=en_gb <CR>')    -- turn on just Brittish English
nmap('<leader>sn', '<CMD> setlocal spell spelllang=nl <CR>')       -- turn on just Dutch
nmap('<leader>fs', function() require('telescope.builtin').spell_suggest() end)

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
nmap('<leader>tt', function() require('neotest').run.run() end)
nmap('<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end)
nmap('<leader>ts', function() require('neotest').summary.toggle() end)
nmap('<leader>to', function() require('neotest').output.open({ quiet = true, short = true, auto_close = true, }) end)
nmap('<leader>tO', function() require('neotest').output_panel.toggle() end)
nmap('<leader>tw', function() require('neotest').watch.toggle() end)
