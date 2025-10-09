return {
  'ggandor/leap.nvim',
  event = 'VeryLazy',
  dependencies = {
    { -- telekinesis
      'ggandor/leap-spooky.nvim',
      config = true,
    },
  },
  config = function(_, _)
    local leap = require('leap')
    leap.opts.labels = 'oienarst;yulqwfp/.,hxcdvOIENARST:YULQWFP?><HXCDVgmvkbj'
    leap.add_default_mappings(true)
    leap.add_repeat_mappings(';', ',')
  end,
}
