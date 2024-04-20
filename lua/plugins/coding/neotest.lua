return {
  'nvim-neotest/neotest',
  -- ft = { 'php', 'rust' },
  cmd = 'Neotest',
  -- event = { 'VeryLazy' },
  dependencies = {
    'antoinemadec/FixCursorHold.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-neotest/nvim-nio',
    'nvim-treesitter/nvim-treesitter',
    -- Runners
    'olimorris/neotest-phpunit',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-phpunit'),
        require('rustaceanvim.neotest'),
      },
    })
  end,
}
