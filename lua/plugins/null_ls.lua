local null_ls = require('null-ls')

local phpcs_path = vim.fn.stdpath('data') .. '/mason/bin/'
local linterRules = '--standard=' .. vim.fn.expand('$HOME') .. '/files/bit-academy/phpcs.xml'

local eslintrc = '--config=' .. vim.fn.expand('$XDG_DATA_HOME') .. '/npm/lib/.eslintrc.js'

local b = null_ls.builtins
null_ls.setup({
  sources = {
    -- js
    b.code_actions.eslint.with({ extra_args = { eslintrc } }),
    b.formatting.eslint.with({ extra_args = { eslintrc } }),

    -- php
    b.diagnostics.phpcs.with({
      command = phpcs_path .. 'phpcs',
      extra_args = { linterRules },
    }),
    b.formatting.phpcbf.with({
      command = phpcs_path .. 'phpcbf',
      extra_args = { linterRules },
    }),

    -- sql
    b.formatting.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }),

    b.code_actions.shellcheck,
    b.code_actions.gitsigns,

    -- register sources for completion
    -- b.completion.luasnip
  },
})
