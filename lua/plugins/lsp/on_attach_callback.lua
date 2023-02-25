local M = {}

M.on_attach = function(_, bufnr)
  local function map(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { buffer = bufnr, remap = false, silent = true, })
  end

  map("gD", vim.lsp.buf.declaration)
  map("gd", vim.lsp.buf.definition)
  map("<leader>D", vim.lsp.buf.type_definition)
  map("K", vim.lsp.buf.hover)
  map("gI", vim.lsp.buf.implementation)
  map("<C-k>", vim.lsp.buf.signature_help)
  map("gR", vim.lsp.buf.references)
  map("<leader>wa", vim.lsp.buf.add_workspace_folder)
  map("<leader>wr", vim.lsp.buf.remove_workspace_folder)
  map("<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
  map("<leader>rn", vim.lsp.buf.rename)
  map("<leader>ca", vim.lsp.buf.code_action)
  map("gl", vim.diagnostic.open_float)
  map("[d", vim.diagnostic.goto_prev)
  map("]d", vim.diagnostic.goto_next)
  map("<leader>f", function() vim.lsp.buf.format { async = true } end)

  vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
end

return M.on_attach