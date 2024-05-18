local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  install = {
    colorscheme = { 'base16-tokyo-city-dark' },
  },
  git = {
    -- defaults for the `Lazy log` command
    log = { '-40' }, -- show the last n commits
  },
  ui = {
    backdrop = 90,
    border = 'rounded',
  },
  checker = {
    enable = false,
  },
})
