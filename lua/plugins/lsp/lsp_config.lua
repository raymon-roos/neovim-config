return {
  'neovim/nvim-lspconfig',
  -- event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
  dependencies = {
    'mason.nvim',
    'mason-lspconfig.nvim',
    { -- nvim and plugins API docs and completions
      'folke/neodev.nvim',
      config = true,
    },
  },
  config = function()
    vim.lsp.set_log_level('off')

    local signs = {
      'DiagnosticSignError',
      'DiagnosticSignWarn',
      'DiagnosticSignHint',
      'DiagnosticSignInfo',
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign, { texthl = sign, text = "●", numhl = '' })
    end

    local border = 'rounded'

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●"
      },
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
        source = true,
        show_header = true,
        prefix = '',
      },
    })
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover, { border = border }
    )
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help, { border = border }
    )

    require('lspconfig.ui.windows').default_options.border = border
  end,
}
