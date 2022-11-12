local null_ls = require('null-ls')

local eslintrc = '--config=' .. vim.fn.expand('$XDG_DATA_HOME') .. '/npm/lib/.eslintrc.js'

local composerPaths = {
  phpcs = vim.fn.expand('$XDG_DATA_HOME') .. '/composer/vendor/squizlabs/php_codesniffer/bin/phpcs',
  phpcbf = vim.fn.expand('$XDG_DATA_HOME') .. '/composer/vendor/squizlabs/php_codesniffer/bin/phpcbf',
  linterRules = '--standard=' .. vim.fn.expand('$HOME') .. '/files/bit-academy/phpcs.xml'
}

local b = null_ls.builtins
null_ls.setup({
  sources = {
    -- js
    b.code_actions.eslint.with({ extra_args = { eslintrc } }),
    b.formatting.eslint.with({ extra_args = { eslintrc } }),

    -- php
    b.diagnostics.phpcs.with({
      command = composerPaths.phpcs,
      extra_args = { composerPaths.linterRules },
    }),
    b.formatting.phpcbf.with({
      command = composerPaths.phpcbf,
      extra_args = { composerPaths.linterRules },
    }),

    -- sql
    b.formatting.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }),

    b.code_actions.shellcheck,
    b.code_actions.gitsigns,

    -- register sources for completion
    -- b.completion.luasnip
  },
})
