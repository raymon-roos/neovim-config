return {
  init_options = {
    globalStoragePath = vim.fn.expand('$XDG_DATA_HOME') .. '/intelephense',
  },
  settings = {
    intelephense = {
      files = {
        maxSize = 2 * 1000 * 1000, -- In bytes
      },
      telemetry = {
        enabled = false,
      },
    },
  },
}
