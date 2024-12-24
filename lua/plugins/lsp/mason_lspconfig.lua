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
    local util = require('lspconfig.util')
    util.default_config = vim.tbl_deep_extend('force', util.default_config, {
      flags = {
        debounce_text_changes = 250,
      },
      capabilities = require('blink.cmp').get_lsp_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      ),
      on_attach = require('utils.lsp_on_attach'),
    })

    local manual_servers = {
      -- Servers that either have custom configuration (under `lua/plugins/lsp/servers`),
      -- or were not installed through mason so have to be registered manually.
      -- Servers installed through mason with default configuration are set up automatically,
      -- So are not listed here.
      { name = 'arduino_language_server', mason = true },
      { name = 'html',                    mason = true },
      { name = 'intelephense',            mason = true },
      { name = 'lua_ls',                  mason = true },
      { name = 'harper_ls',               mason = true },
      { name = 'tailwindcss',             mason = true },
      { name = 'ltex',                    mason = false },
      { name = 'nil_ls',                  mason = false },
      -- { name = 'nixd',                    mason = false },
      { name = 'basedpyright',            mason = false },
      { name = 'hls',                     mason = false },
      { name = 'gopls',                   mason = false },
    }

    local handlers = {
      -- Default setup function used by mason-lspconfig for servers without custom configuration
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
    }

    for _, server in pairs(manual_servers) do
      local server_config_exist, server_opts = pcall(require, 'plugins.lsp.servers.' .. server.name)

      if server.mason then
        handlers[server.name] = function()
          require('lspconfig')[server.name].setup(server_opts)
        end
      else
        -- In case server hasn't been installed through mason, call `lspconfig[...].setup()` directly
        require('lspconfig')[server.name].setup(server_config_exist and server_opts or {})
      end
    end

    return {
      handlers = handlers
    }
  end,
}
