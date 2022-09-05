if vim.fn.exists('g:vscode') == 1 then
  require('core.vscode')
else
  require('core.options')
  require('core.autocmds')
  require('core.keybindings')
  require('plugins.packer')
  require('plugins.zettelkasten')
end
