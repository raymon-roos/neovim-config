return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    disable_filetype = { 'TelescopePrompt' },
    check_ts = true,
    map_cr = true,
    map_bs = true,
    map_c_h = true,
    map_c_w = true,
  },
}
