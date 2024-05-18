return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  build = ':MasonUpdate',
  opts = {
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
