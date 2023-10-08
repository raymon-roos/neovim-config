require('ibl').setup({
  indent = {
    char =  '·',
    -- tab_char = '▏',
    tab_char = '┊',
    -- highlight = 'comment',
  },
  scope = {
    show_start = false,
    show_end = false,
    priority = 2,
    -- highlight = 'CursorLineSign',
  },
})
