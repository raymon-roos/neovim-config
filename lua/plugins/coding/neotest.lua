return {
  'nvim-neotest/neotest',
  -- ft = { 'php', 'rust' },
  cmd = 'Neotest',
  -- event = { 'VeryLazy' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Runners
    'olimorris/neotest-phpunit',
    'rouge8/neotest-rust',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-phpunit'),
        require('neotest-rust'),
      },
    })
  end,
}
