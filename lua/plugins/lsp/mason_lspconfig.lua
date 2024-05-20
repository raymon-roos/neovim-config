return {
  'williamboman/mason-lspconfig.nvim',
  cmd = { 'LspInstall', 'LspUninstall' },
  dependencies = {
    'mason.nvim',
    {
      'folke/neodev.nvim',
      config = true,
    }
  },
  opts = function()
    -- insert propterties into every attached server instance
    local util = require('lspconfig').util
    util.default_config = vim.tbl_deep_extend('force', util.default_config, {
      flags = {
        debounce_text_changes = 250,
      },
      capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      ),
      on_attach = require('utils.lsp_on_attach'),
    })

    return {
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
        ['lua_ls'] = function()
          local runtime_path = vim.split(package.path, ';')
          table.insert(runtime_path, 'lua/?.lua')
          table.insert(runtime_path, 'lua/?/init.lua')

          require('lspconfig').lua_ls.setup({
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT', path = runtime_path },
                diagnostics = {
                  globals = { 'vim' },
                },
                workspace = {
                  library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                  },
                },
                telemetry = {
                  enable = false,
                },
                completion = {
                  callSnippet = 'Replace',
                },
                format = {
                  defaultConfig = {
                    indent_style = 'space',
                    indent_size = 2,
                    quote_style = 'single',
                  }
                }
              },
            },
          })
        end,
        ['html'] = function()
          require('lspconfig').html.setup({
            filetypes = { 'html', 'twig' },
            settings = {
              html = {
                mirrorCursorOnMatchingTag = { true },
              },
            },
          })
        end,
        ['tailwindcss'] = function()
          require('lspconfig').tailwindcss.setup({
            filetypes = { 'php', 'html', 'js', 'blade.php' },
            autostart = false,
            settings = {
              tailwindcss = {},
            },
          })
        end,
        ['ltex'] = function()
          require('lspconfig').ltex.setup({
            on_attach = function(_, bufnr)
              require('utils.lsp_on_attach')(_, bufnr)
              require('ltex-utils').on_attach(bufnr)
            end,
            settings = {
              ltex = {
                language = 'en-GB',
                diagnosticSeverity = 'information',
                additionalRules = {
                  enablePickyRules = true,
                },
                disabledRules = {
                  ['en-GB'] = { 'DASH_RULE', 'EN_QUOTES' },
                  ['en-US'] = { 'DASH_RULE', 'EN_QUOTES' },
                },
                ['ltex-ls'] = {
                  logLevel = 'severe',
                },
                completionEnable = true,
              },
            },
          })
        end,
        ['intelephense'] = function()
          require('lspconfig').intelephense.setup({
            init_options = {
              globalStoragePath = vim.fn.expand('$XDG_DATA_HOME') .. '/intelephense',
            },
            settings = {
              intelephense = {
                files = {
                  maxSize = 2000000, -- In bytes
                },
                telemetry = {
                  enabled = false,
                },
              },
            },
          })
        end,
        ['arduino_language_server'] = function()
          require('lspconfig').arduino_language_server.setup({
            cmd = {
              'arduino-language-server',
              '-cli-config',
              '/home/ray/.xdg/config/arduino15/arduino-cli.yaml',
              '-clangd',
              vim.fn.expand('$XDG_DATA_HOME') .. '/nvim/mason/bin/clangd',
            },
          })
        end,
      },
    }
  end,
}
