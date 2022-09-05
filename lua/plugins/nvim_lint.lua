require('lint').linters_by_ft = {
  javascript = { 'eslint_d' },
  bash = { 'shellcheck' },
  latex = { 'textlint' },
  markdown = { 'textlint' },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function() require("lint").try_lint() end,
})
