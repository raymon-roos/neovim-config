vim.lsp.set_log_level("off")

local lspconfig = require('lspconfig')

local util = lspconfig.util

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

util.default_config = vim.tbl_deep_extend('force',
  util.default_config,
  {
    flags = {
      debounce_text_changes = 100,
    },
    capabilities = capabilities
  }
)

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
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    lspconfig.sumneko_lua.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT', -- Nvim uses LuaJIT
            path = runtime_path,
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
          telemetry = {
            enable = false,
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
      'force', util.default_config, require('plugins.lsp.intelephense')
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

-- for server_name,setup_callback in ipairs(require('plugins.lsp.server_configs')) do
--   table.insert(mason_lspconfig.setup_handlers[server_name], setup_callback)
-- end
