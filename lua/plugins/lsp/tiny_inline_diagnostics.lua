return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy', -- Or `LspAttach`
  priority = 1000,    -- needs to be loaded in first
  opts = {
    options = {
      overwrite_events = { 'LspAttach', 'BufEnter' },
      show_source = true,
      overflow = {
        mode = 'wrap',
        padding = 5,
      },
      -- softwrap = 70,
      -- break_line = {
      --   enabled = true,
      --   after = 70,
      -- },
    },
  }
}
