local util = require('conform.util')

util.add_formatter_args(
  require('conform.formatters.prettier'),
  { '--config', vim.fn.expand('$XDG_CONFIG_HOME') .. '/prettier/.prettierrc.json' },
  { append = true }
)

util.add_formatter_args(
  require('conform.formatters.eslint_d'),
  { '--config', vim.fn.expand('$XDG_CONFIG_HOME') .. '/eslint/.eslintrc.js' },
  { append = true }
)

util.add_formatter_args(require('conform.formatters.phpcbf'), {
  '--standard=' .. vim.fn.expand('$XDG_CONFIG_HOME') .. '/phpcs/phpcs.xml',
}, { append = true })

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { { 'prettier', 'eslint_d' } },
    html = { 'prettier' },
    blade = { 'blade-formatter' },
    css = { 'prettier' },
    php = { 'phpcbf' },
    rust = { 'rustfmt' },
    bash = { 'shellcheck', 'shellharden', 'shfmt' },
    markdown = { 'prettier' },
    latex = { 'latexindent' },
  },
  format_on_save = function(bufnr)
    -- Disable autoformat on certain filetypes
    local ignore_filetypes = {}
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    -- Disable autoformat for files in a certain path
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match('/node_modules/') or bufname:match('/vendor/') then
      return
    end

    return { timeout_ms = 400, lsp_fallback = true }
  end,
})

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    vim.g.disable_autoformat = true
  else
    -- FormatDisable! will disable formatting everywhere
    vim.b.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})
