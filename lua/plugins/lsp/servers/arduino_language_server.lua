return {
  cmd = {
    'arduino-language-server',
    '-cli-config',
    '/home/ray/.xdg/config/arduino15/arduino-cli.yaml',
    '-clangd',
    vim.fn.expand('$XDG_DATA_HOME') .. '/nvim/mason/bin/clangd',
  },
}
