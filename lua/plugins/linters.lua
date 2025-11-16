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
      css = { 'stylelint' },
      dockerfile = { 'hadolint' },
      go = { 'golangcilint' },
      javascript = { 'biomejs' },
      latex = { 'chktex' },
      lua = { 'selene' },
      -- nix = { 'statix' },
      php = { 'phpcs' },
      sh = { 'shellcheck' },
    }

    vim.api.nvim_create_autocmd({ 'TextChanged' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
