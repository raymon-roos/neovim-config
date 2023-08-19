vim.lsp.set_log_level('off')

local lspconfig = require('lspconfig')

local util = lspconfig.util

util.default_config = vim.tbl_deep_extend('force',
  util.default_config,
  {
    flags = {
      debounce_text_changes = 250,
    },
    -- insert propterties into _every_ attached server instance
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = require('plugins.lsp.on_attach_callback'),
  }
)

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup_handlers({
  -- The first entry (without a key) will be the default handler and will be
  -- called for each installed server that doesn't have a dedicated handler.
  function(server_name)
    lspconfig[server_name].setup({})
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ['lua_ls'] = function()
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = runtime_path,
          },
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
        },
      },
    }
  end,
  ['html'] = function()
    lspconfig.html.setup {
      filetypes = { 'html', 'twig' },
      settings = {
        html = {
          mirrorCursorOnMatchingTag = { true },
        },
      }
    }
  end,
  ['tailwindcss'] = function()
    lspconfig.tailwindcss.setup {
      filetypes = { 'php', 'html', 'js', 'blade.php' },
      autostart = false,
      settings = {
        tailwindcss = {}
      }
    }
  end,
  ['ltex'] = function()
    lspconfig.ltex.setup {
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
    }
  end,
  ['intelephense'] = function()
    lspconfig.intelephense.setup {
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
      }
    }
  end
})
