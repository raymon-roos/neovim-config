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
      extra_args = { "--standard=/home/ray/files/bit-academy/phpcs.xml" },
    }),

  -- Register sources for formating
    null_ls.builtins.formatting.phpcbf.with({
      extra_args = { "--standard=/home/ray/files/bit-academy/phpcs.xml" },
    }),

  -- register sources for completion
    null_ls.builtins.completion.spell,
  },
})
