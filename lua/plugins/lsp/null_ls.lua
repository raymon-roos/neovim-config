local null_ls = require('null-ls')

local phpcs_path = vim.fn.stdpath('data') .. '/mason/bin/'
local linterRules = '--standard=' .. vim.fn.expand('$HOME') .. '/files/bit-academy/phpcs.xml'

local eslint_extra_args = '--config=' .. vim.fn.expand('$XDG_DATA_HOME') .. '/npm/lib/.eslintrc.js'
    .. ' --fix-dry-run'
    .. ' --stdin'

local b = null_ls.builtins
null_ls.setup({
  sources = {
    b.diagnostics.eslint_d.with({ extra_args = { eslint_extra_args, } }), -- js
    b.diagnostics.phpcs.with({ -- php
      command = phpcs_path .. 'phpcs',
      extra_args = { linterRules }, }
    ),

    b.code_actions.eslint_d.with({ extra_args = { eslint_extra_args } }), -- js
    b.code_actions.shellcheck, -- sh
    b.code_actions.gitsigns, -- git integration

    b.formatting.rustfmt, -- rust
    b.diagnostics.eslint_d.with({ extra_args = { eslint_extra_args } }), -- js
    b.formatting.prettierd, -- js(frameworks)/html/css/md
    b.formatting.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }), -- sql
    b.formatting.phpcbf.with({ -- php
      command = phpcs_path .. 'phpcbf',
      extra_args = { linterRules }, }
    ),

    -- completion
    -- b.completion.luasnip
  },

  border = 'rounded',
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
})
