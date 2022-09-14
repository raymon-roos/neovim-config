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
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local on_attach = function(client, bufnr)
  local function lsp_highlight_document()
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec(
      -- vim.api.nvim_create_augroup('lsp_document_highlight' , { clear = true })
      -- vim.api.nvim_create_autocmd('CursorHold', {
      --   group = 'lsp_document_highlight',
      --   pattern = '* <buffer>',
      --   command = '<buffer> lua vim.lsp.buff.document_highlight()'
      -- })
      -- vim.api.nvim_create_autocmd('CursorMoved', {
      --   group = 'lsp_document_highlight',
      --   pattern = '* <buffer>',
      --   command = '<buffer> lua vim.lsp.buff.clear_references()'
      -- })
        [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]] ,
        false
      )
    end
  end

  local function map(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { buffer = bufnr, remap = false, silent = true, })
  end

  map("gD", vim.lsp.buf.declaration)
  map("gd", vim.lsp.buf.definition)
  map("<leader>D", vim.lsp.buf.type_definition)
  map("K", vim.lsp.buf.hover)
  map("gi", vim.lsp.buf.implementation)
  map("<C-k>", vim.lsp.buf.signature_help)
  map("gr", vim.lsp.buf.references)
  map("<leader>wa", vim.lsp.buf.add_workspace_folder)
  map("<leader>wr", vim.lsp.buf.remove_workspace_folder)
  map("<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
  map("<leader>rn", vim.lsp.buf.rename)
  map("<leader>ca", vim.lsp.buf.code_action)
  map("gl", vim.diagnostic.open_float)
  map("[d", vim.diagnostic.goto_prev)
  map("]d", vim.diagnostic.goto_next)
  -- map("<leader>q", vim.diagnostic.setloclist) -- trouble.nvim does a way better job at this
  map("<leader>f", vim.lsp.buf.formatting)

  vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
  lsp_highlight_document()
end

local capabilitiesUpdated = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
capabilitiesUpdated.textDocument.completion.completionItem.snippetSupport = true

local lsp_defaults = {
  flags = {
    debounce_text_changes = 100,
  },
  capabilities = capabilitiesUpdated
}

local lspconfig = require('lspconfig')
lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

local capabilities = lsp_defaults.capabilities

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup {
      capabilities = capabilities,
      on_attach = on_attach,
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
  end,
  ['html'] = function()
    lspconfig.html.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      mirrorCursorOnMatchingTag = true
    }
  end,
  ['tailwindcss'] = function()
    -- lspconfig.tailwindcss.setup {
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   root_pattern = { 'tailwind.config.js' },
    --   filetypes = { 'html', 'php', 'javascript' }
    -- }
  end,
  ['intelephense'] = function()
    lspconfig.util.default_config = vim.tbl_deep_extend(
      'force', lspconfig.util.default_config, require('plugins.intelephense')
    )
    lspconfig.intelephense.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,
  ['phpactor'] = function()
    -- lspconfig.phpactor.setup {
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- }
  end,
  ['ltex'] = function()
    lspconfig.ltex.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ltex = {
          language = { 'en-GB' }
        }
      }
    }
  end
})
