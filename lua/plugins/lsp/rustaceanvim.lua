return {
  'mrcjkb/rustaceanvim',
  ft = 'rust',
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        code_actions = {
          ui_select_fallback = true,
        },
        float_win_config = {
          border = 'rounded',
        }
      },
      server = {
        on_attach = function()
          require('utils.lsp_on_attach')()

          local nmap = require('utils.keymapper').nmap

          nmap('gL', function() vim.cmd.RustLsp('renderDiagnostic') end)
          nmap('<leader>ge', function() vim.cmd.RustLsp('explainError') end)
          nmap('<S-j>', function() vim.cmd.RustLsp('joinLines') end)
          nmap('<leader>ca', function() vim.cmd.RustLsp('codeAction') end)
        end,
      },
    }
  end,
}
