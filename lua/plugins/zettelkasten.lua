--  ZETTELKASTEN CONFIGURATION
--  Note that $NOTES_DIR is an environment variable pointing to the single flat
--  directory I keep all my zettels in

local nmap = require('core.keybindings')

--  Change working directory to zettelkasten and open index
nmap('<leader>zi', '<cmd> e $NOTES_DIR/index-202202270044.md <cr> <cmd> cd $NOTES_DIR <cr> <cmd> pwd <cr>')
--  mnemonic: zettel->index

-- Generate ctags
nmap('<leader>tt', '<cmd> !ctags -R <cr>')
-- mnemonic: tags->tags

vim.cmd( -- seriously nasty way of doing this, but hey, *pure lua* 
[[
  " Quickly create a new entry into the zettelkasten 
  command! -nargs=1 NewZettel :execute ":e" fnameescape($NOTES_DIR . "/<args>-") . strftime("%Y%m%d%H%M") . ".md" 
  nnoremap <leader>zz :NewZettel
  " mnemonic: zettel->zettel


  " Create a new note in a vertically stacked window
  command! -nargs=1 SplitZettel :execute ":split" fnameescape($NOTES_DIR . "/<args>-") . strftime("%Y%m%d%H%M") . ".md"
  nnoremap <leader>zv :SplitZettel
  " mnemonic: zettel->vertical


  " Update tag list in index.md 
  " Very much work in progress, haven't found a good way to delete the old list
  " of tags from index yet

  " function GenerateTags()
  " :execute ':%read !sed ''/^\!_/d'' $NOTES_DIR/tags | sed ''/^\@/d'' $NOTES_DIR/index-202202270044.md | awk ''{ print "@" $1 }'' | sort -u'
  " endfunction

  command! GenerateTags :execute "%read !sed '/^\!_/d' $NOTES_DIR/tags | awk '{ print "@" $1 }' | sort -u"
  nnoremap <leader>tg GenerateTags <CR>
  " mnemonic: tags->generate


  " Look for notes
  command! -nargs=1 Ngrep grep! -r "<args>" $NOTES_DIR
  nnoremap <leader>zs :Ngrep
  " mnemonic: zettel->search


  " Open a navigation panel for grep'd  notes
  command! Vlist botright vertical copen | vertical resize 50
  nnoremap <leader>zl :Vlist<CR>
  " mnemonic: zettel->list
]], true)





