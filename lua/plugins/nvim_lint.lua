require('nvim-lint').linters_by_ft = {
  javascript = { 'eslint_d' },
  bash = { 'shellcheck' },
  latex = { 'textlint' },
  markdown = { 'textlint' },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function() require("nvim-lint").try_lint() end,
})
