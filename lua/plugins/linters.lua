require('lint').linters.phpcs.args = {
  '-q',
  '--standard=' .. vim.fn.expand('$XDG_CONFIG_HOME') .. '/phpcs/phpcs.xml',
  '--report=json',
  '-',
}

require('lint').linters.eslint.args = {
  '--config=' .. vim.fn.expand('$XDG_CONFIG_HOME') .. '/eslint/.eslintrc.js',
  '--stdin',
  '--stdin-filename',
  function()
    return vim.api.nvim_buf_get_name(0)
  end,
}

require('lint').linters_by_ft = {
  markdown = { 'vale' },
  javascript = { 'eslint_d' },
  php = { 'phpcs' },
  bash = { 'shellcheck' },
  lua = { 'luacheck' },
  latex = { 'chktex' },
}

vim.api.nvim_create_autocmd({ 'TextChanged' }, {
  callback = function()
    require('lint').try_lint()
  end,
})