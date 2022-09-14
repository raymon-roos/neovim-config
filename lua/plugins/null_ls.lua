local null_ls = require("null-ls")

null_ls.setup({
  sources = {
  -- Register sources for code actions
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.code_actions.gitsigns,

  -- Register sources for diagnostics
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.phpcs.with({
      command = vim.fn.expand('$XDG_CONFIG_HOME') .. "/composer/vendor/squizlabs/php_codesniffer/bin/phpcs",
      extra_args = { "--standard=~/files/bit-academy/phpcs.xml" },
    }),

  -- Register sources for formating
    null_ls.builtins.formatting.phpcbf.with({
      command = vim.fn.expand('$XDG_CONFIG_HOME') .. "/composer/vendor/squizlabs/php_codesniffer/bin/phpcbf",
      extra_args = { "--standard=~/files/bit-academy/phpcs.xml" },
    }),

  -- register sources for completion
    -- null_ls.builtins.completion.phpactor,
  },
})
