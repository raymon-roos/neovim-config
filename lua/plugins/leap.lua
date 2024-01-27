return {
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    dependencies = {
      {
        'ggandor/leap-spooky.nvim',
        config = true,
      },
      { -- smarter f/t
        'ggandor/flit.nvim',
        opts = { labeled_modes = 'nx' },
      },
    },
    config = function(_, opts)
      local leap = require('leap')
      leap.add_default_mappings(true)
      leap.add_repeat_mappings(';', ',')
    end,
  },
}
