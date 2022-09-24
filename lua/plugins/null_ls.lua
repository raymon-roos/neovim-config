local null_ls = require('null-ls')

local eslintrc = '--config=' .. vim.fn.expand('$XDG_DATA_HOME') .. '/npm/lib/.eslintrc.js'
local composerBin = vim.fn.expand('$XDG_DATA_HOME') .. '/composer/vendor/squizlabs/php_codesniffer/bin/'
local composerStandard =  '--standard=~/files/bit-academy/phpcs.xml'

null_ls.setup({
  sources = {
    -- eslint 
    null_ls.builtins.code_actions.eslint.with({ extra_args = { eslintrc } }),
    null_ls.builtins.diagnostics.eslint.with({ extra_args = { eslintrc } }),
    null_ls.builtins.formatting.eslint.with({ extra_args = { eslintrc } }),

    -- phpcs / phpcbf
    null_ls.builtins.diagnostics.phpcs.with({
      command = composerBin .. 'phpcs',
      extra_args = { composerStandard },
    }),
    null_ls.builtins.formatting.phpcbf.with({
      command = composerBin .. 'phpcbf',
      extra_args = { composerStandard },
    }),

    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.code_actions.gitsigns,

    -- register sources for completion
    -- null_ls.builtins.completion.phpactor,
  },
})
