require("null-ls").setup({
    sources = {
        require("null-ls").builtins.code_actions.eslint_d,
        -- require("null-ls").builtins.code_actions.refactoring,
        require("null-ls").builtins.code_actions.shellcheck,
        require("null-ls").builtins.diagnostics.eslint_d,
        require("null-ls").builtins.diagnostics.php,
        require("null-ls").builtins.diagnostics.phpcs.with({
          extra_args = { "--standard=/home/ray/files/bit-academy/phpcs.xml" },
        }),
        require("null-ls").builtins.formatting.phpcbf.with({
          extra_args = { "--standard=/home/ray/files/bit-academy/phpcs.xml" },
        }),
        -- require("null-ls").builtins.formatting.phpcs,
        require("null-ls").builtins.completion.spell,
    },
})
