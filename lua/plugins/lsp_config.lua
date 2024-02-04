return {
  {
    'neovim/nvim-lspconfig',
    -- event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
    dependencies = {
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { -- nvim and plugins API docs and completions
        'folke/neodev.nvim',
        config = true,
      },
    },
    config = function()
      vim.lsp.set_log_level('off')

      vim.cmd([[autocmd! ColorScheme * highlight link LspInfoBorder FloatBorder]])

      local signs = {
        { name = 'DiagnosticSignError', text = ' ' },
        { name = 'DiagnosticSignWarn', text = ' ' },
        { name = 'DiagnosticSignHint', text = ' ' },
        { name = 'DiagnosticSignInfo', text = ' ' },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
      end

      local border = 'rounded'

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
          style = 'minimal',
          border = border,
          source = 'always',
          show_header = true,
          prefix = '',
        },
      })
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
      vim.lsp.handlers['textDocument/signatureHelp'] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
      vim.diagnostic.config({
        float = { border = border },
      })
      require('lspconfig.ui.windows').default_options.border = border

      local lspconfig = require('lspconfig')
      local util = lspconfig.util

      -- insert propterties into _every_ attached server instance
      util.default_config = vim.tbl_deep_extend('force', util.default_config, {
        flags = {
          debounce_text_changes = 250,
        },
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = require('utils.lsp_on_attach'),
      })

      require('mason-lspconfig').setup({
        handlers = {
          -- The first entry (without a key) will be the default handler and will be
          -- called for each installed server that doesn't have a dedicated handler.
          function(server_name)
            lspconfig[server_name].setup({})
          end,
          ['lua_ls'] = function()
            local runtime_path = vim.split(package.path, ';')
            table.insert(runtime_path, 'lua/?.lua')
            table.insert(runtime_path, 'lua/?/init.lua')

            lspconfig.lua_ls.setup({
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
            lspconfig.html.setup({
              filetypes = { 'html', 'twig' },
              settings = {
                html = {
                  mirrorCursorOnMatchingTag = { true },
                },
              },
            })
          end,
          ['tailwindcss'] = function()
            lspconfig.tailwindcss.setup({
              filetypes = { 'php', 'html', 'js', 'blade.php' },
              autostart = false,
              settings = {
                tailwindcss = {},
              },
            })
          end,
          ['ltex'] = function()
            lspconfig.ltex.setup({
              settings = {
                ltex = {
                  language = 'en-GB',
                  diagnosticSeverity = 'information',
                  additionalRules = {
                    enablePickyRules = true,
                    motherTongue = 'nl',
                  },
                  hiddenFalsePositives = { 'Bit', 'Academy' },
                  ['ltex-ls'] = {
                    logLevel = 'severe',
                  },
                  completionEnabled = true,
                },
              },
            })
          end,
          ['intelephense'] = function()
            lspconfig.intelephense.setup({
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
            lspconfig.arduino_language_server.setup({
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
      })
    end,
  },

  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    opts = {
      ui = {
        style = 'minimal',
        border = 'rounded',
        icons = {
          package_installed = '✓ ',
          package_pending = '➜ ',
          package_uninstalled = '✗ ',
        },
      },
    },
  },
}
