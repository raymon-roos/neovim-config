local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
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

vim.lsp.set_log_level("off")

local on_attach = function(_, bufnr)
  local function map(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { buffer = bufnr, remap = false, silent = true, })
  end

  map("gD", vim.lsp.buf.declaration)
  map("gd", vim.lsp.buf.definition)
  map("<leader>D", vim.lsp.buf.type_definition)
  map("K", vim.lsp.buf.hover)
  map("gI", vim.lsp.buf.implementation)
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
  map("<leader>f", function() vim.lsp.buf.format { async = true } end)

  vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
end

local lsp_defaults = {
  flags = {
    debounce_text_changes = 100,
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )
}

local lspconfig = require('lspconfig')
local util = lspconfig.util

util.default_config = vim.tbl_deep_extend('force', util.default_config, lsp_defaults)

local capabilities = lsp_defaults.capabilities

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({
  -- The first entry (without a key) will be the default handler and will be
  -- called for each installed server that doesn't have a dedicated handler.
  function(server_name)
    lspconfig[server_name].setup {
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
      settings = {
        html = {
          mirrorCursorOnMatchingTag = { true },
          filetypes = { 'html', 'twig', 'php' },
        },
      }
    }
  end,
  ['tailwindcss'] = function()
    --   lspconfig.tailwindcss.setup {
    --     capabilities = capabilities,
    --     on_attach = on_attach,
    --     settings = {
    --       tailwindCSS = {
    --         autostart = false,
    --       }
    --     }
    --   }
  end,
  ['intelephense'] = function()
    util.default_config = vim.tbl_deep_extend(
      'force', util.default_config, require('plugins.intelephense')
    )
    lspconfig.intelephense.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
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
