-- Integrate external linters
return {
  'mfussenegger/nvim-lint',
  event = 'VeryLazy',
  config = function()
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
      javascript = { 'eslint_d' },
      php = { 'phpcs' },
      sh = { 'shellcheck' },
      lua = { 'luacheck' },
      latex = { 'chktex' },
      css = { 'stylelint' },
    }

    vim.api.nvim_create_autocmd({ 'TextChanged' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
