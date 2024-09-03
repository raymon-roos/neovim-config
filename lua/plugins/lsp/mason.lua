return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  build = ':MasonUpdate',
  opts = {
    log_level = vim.log.levels.WARN,
    ui = {
      style = 'minimal',
      border = 'rounded',
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
  },
}
