return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
  dependencies = {
    { -- nvim and plugins API docs and completions
      'folke/lazydev.nvim',
      ft = 'lua',
      config = true,
    },
  },
  config = function()
    vim.lsp.set_log_level('off')

    local border = 'rounded'

    vim.diagnostic.config({
      -- virtual_text = { prefix = '●' },
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '●',
          [vim.diagnostic.severity.WARN] = '●',
          [vim.diagnostic.severity.HINT] = '●',
          [vim.diagnostic.severity.INFO] = '●',
        },
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = border,
        source = true,
        show_header = true,
        prefix = '',
      },
    })

    local hover = vim.lsp.buf.hover
    vim.lsp.buf.hover = function()
      return hover({
        border = 'rounded',
        max_width = math.floor(vim.o.columns * 0.7),
        max_height = math.floor(vim.o.lines * 0.7),
      })
    end

    vim.lsp.config('*', {
      capabilities = require('blink.cmp').get_lsp_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      ),
      on_attach = require('utils.lsp_on_attach'),
    })

    vim.lsp.enable({
      'arduino-language-server',
      'basedpyright',
      'docker_compose_language_service',
      'dockerls',
      'emmet_language_server', -- HTML real time snippet "language"
      'gopls',
      'harper_ls',             -- New, faster ltex-ls alternative
      'hls',                   -- Haskell
      'intelephense',          -- PHP
      -- 'phpactor',           -- PHP
      'ltex_plus',             -- Maintained fork of ltex-ls
      'lua_ls',
      'nil_ls',
      'nixd',
      'tailwindcss',
      'cssls',  -- from vscode-langservers-extracted
      'jsonls', -- from vscode-langservers-extracted
      'html',   -- from vscode-langservers-extracted
      -- 'superhtml', -- Stricter HTML LSP
      'eslint', -- from vscode-langservers-extracted
      'nushell',
    })
  end,
}
