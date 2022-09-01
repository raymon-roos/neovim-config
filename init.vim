if exists('g:vscode')  
  lua require('core.vscode') 
else
  lua require('core.options')
  lua require('core.autocmds')
  lua require('core.keybindings')
  lua require('plugins.packer')
  lua require('plugins.zettelkasten')
endif
