local null_ls = require('null-ls')

local phpcs_path = vim.fn.stdpath('data') .. '/mason/bin/'
local phpcs_rules = '--standard=' .. vim.fn.expand('$HOME') .. '/files/bit-academy/phpcs.xml'

local eslint_extra_args = {
  '--config=' .. vim.fn.expand('$XDG_DATA_HOME') .. '/npm/lib/.eslintrc.js',
  ' --fix-dry-run',
  ' --stdin',
}

local b = null_ls.builtins
null_ls.setup({
  sources = {
    b.diagnostics.eslint_d.with({ extra_args = eslint_extra_args, }), -- js
    b.diagnostics.phpcs.with({ -- php
      command = phpcs_path .. 'phpcs',
      extra_args = { phpcs_rules },
    }),

    b.code_actions.eslint_d.with({ extra_args = eslint_extra_args }), -- js
    b.code_actions.shellcheck, -- sh
    b.code_actions.gitsigns, -- git integration

    b.formatting.shellharden, -- sh
    b.formatting.rustfmt, -- rust
    b.formatting.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }), -- sql
    b.formatting.eslint_d.with({ extra_args = eslint_extra_args }), -- js
    b.formatting.prettierd.with({ -- js(frameworks)/html/css/md
      disabled_filetypes = { 'html' }, -- html-ls already takes care of this
    }),
    b.formatting.phpcbf.with({ -- php
      command = phpcs_path .. 'phpcbf',
      extra_args = { phpcs_rules, '--config-set tab_width 4' },
    }),
    b.formatting.stylua, -- lua
    b.formatting.blade_formatter, -- laravel blade templates

    -- completion
    -- b.completion.luasnip
  },

  border = 'rounded',
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
})
