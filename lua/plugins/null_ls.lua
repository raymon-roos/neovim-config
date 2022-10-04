local null_ls = require('null-ls')

local eslintrc = '--config=' .. vim.fn.expand('$XDG_DATA_HOME') .. '/npm/lib/.eslintrc.js'
local composerBin = vim.fn.expand('$XDG_DATA_HOME') .. '/composer/vendor/squizlabs/php_codesniffer/bin/'
local composerStandard = '--standard=~/files/bit-academy/phpcs.xml'

local b = null_ls.builtins
null_ls.setup({
  sources = {
    -- eslint 
    b.code_actions.eslint.with({ extra_args = { eslintrc } }),
    b.diagnostics.eslint.with({ extra_args = { eslintrc } }),
    b.formatting.eslint.with({ extra_args = { eslintrc } }),

    -- phpcs / phpcbf
    b.diagnostics.phpcs.with({
      command = composerBin .. 'phpcs',
      extra_args = { composerStandard },
    }),
    b.formatting.phpcbf.with({
      command = composerBin .. 'phpcbf',
      extra_args = { composerStandard },
    }),

    b.code_actions.shellcheck,
    b.code_actions.gitsigns,

    -- register sources for completion
    -- b.completion.phpactor,
  },
})
