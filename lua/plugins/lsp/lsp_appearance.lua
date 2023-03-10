vim.cmd [[autocmd! ColorScheme * highlight link LspInfoBorder FloatBorder]]

local signs = {
  { name = "DiagnosticSignError", text = " " },
  { name = "DiagnosticSignWarn", text = " " },
  { name = "DiagnosticSignHint", text = " " },
  { name = "DiagnosticSignInfo", text = " " },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local border = 'rounded'

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = border, }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = border, }
)

vim.diagnostic.config {
  float = { border = border }
}

require('lspconfig.ui.windows').default_options.border = border
