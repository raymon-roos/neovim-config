--  ZETTELKASTEN CONFIGURATION
--  Note that $NOTES_DIR is an environment variable pointing to the single flat
--  directory I keep all my zettels in

local bindkeys = require('../core/keybindings')

--  Change working directory to my zettelkasten and open index
bindkeys('<leader>zi', '<cmd> e $NOTES_DIR/index-202202270044.md <cr> <cmd> cd $NOTES_DIR <cr> <cmd> pwd <cr>')
--  mnemonic: zettel->index

-- Generate ctags
bindkeys('<leader>tt', '<cmd> !ctags -R <cr>')
-- mnemonic: tags->tags

-- local newZettel = vim.api.nvim_exec(
--   [[
-- 		command! -nargs=1 NewZettel :execute ":e" fnameescape($NOTES_DIR . "/<args>-") . strftime("%Y%m%d%H%M") . ".md" 
-- 	]],
-- )


