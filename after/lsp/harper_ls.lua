---@type vim.lsp.Config
return {
  filetypes = { "markdown", "gitcommit", "html", "tex", "latex", "typst" },
  settings = {
    ["harper-ls"] = {
      dialect = 'British',
    },
  }
}
