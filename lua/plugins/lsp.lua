local lsp_defaults = {
  flags = {
    debounce_text_changes = 120,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
}

local lspconfig = require('lspconfig')
lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = false,
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
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local on_attach = function(client, bufnr)

  local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true, bufnr }
    vim.api.nvim_buf_set_keymap("n", "gD", vim.lsp.buf.declaration(), opts)
    vim.api.nvim_buf_set_keymap("n", "gd", vim.lsp.buf.definition(), opts)
    vim.apn.nvim_buf_set_keymap("n", "K", vim.lsp.buf.hover(), opts)
    vim.api.nvim_buf_set_keymap("n", "gi", vim.lsp.buf.implementation(), opts)
    vim.api.nvim_buf_set_keymap("n", "<C-k>", vim.lsp.buf.signature_help(), opts)
    vim.api.nvim_buf_set_keynnp("n", "<leader>rn", vim.lsp.buf.rename(), opts)
    vim.api.nvim_buf_set_keymap("n", "gr", vim.lsp.buf.references(), opts)
    vim.api.nvim_buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action(), opts)
    vim.api.nvim_buf_set_keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.api.nvim_buf_set_keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.api.nvim_buf_set_keymap("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.api.nvim_buf_set_keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.api.nvim_buf_set_keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.api.nvim_buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    -- vim.api.nvim_buf_set_keymr, "n", "<leader>f", vim.diagnostic.open_float(), opts)
    vim.api.nvim_buf_set_keymap("n", "[d", vim.diagnostic.goto_prev({ border = "rounded" }), opts)
    vim.api.nvim_buf_set_keymap("n", "]d", vim.diagnostic.goto_next({ border = "rounded" }), opts)
    vim.api.nvim_buf_set_keymap("n", "gl", vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" }), opts)
    vim.api.nvim_buf_set_keymap("n", "<leader>q", vim.diagnostic.setloclist(), opts)
    vim.api.nvim_buf_set_keymap("n", "<leader>f", vim.lsp.buf.formatting, opts)
  end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  lsp_highlight_document(client)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
  'bashls',
  'cssls',
  'ltex',
  'phpactor',
  'sqlls',
  'tailwindcss',
  'vimls'
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

require('lspconfig')['sumneko_lua'].setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}

capabilities.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig')['html'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  mirrorCursorOnMatchingTag = true
}
