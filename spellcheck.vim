:set nospell

" Set combination English/Dutch spellchecking (local buffer only)
command! SpellBoth :setlocal spell spelllang=en,nl
nnoremap <leader>sb :SpellBoth<CR>
" mnemonic: Spelling->Both

" Set British spellchecking (local buffer only)
command! SpellBrittish :setlocal spell spelllang=en_gb 
nnoremap <leader>se :SpellBrittish<CR> 
" mnemonic: Spelling->English

" Set Dutch spellchecking (local buffer only)
command! SpellDutch :setlocal spell spelllang=nl
nnoremap <leader>sn :SpellDutch<CR>
" mnemonic: Spelling->Nederlands

" Toggle spellcheck (local buffer only)  
command! SpellToggle :setlocal nospell!
nnoremap <leader>ss :SpellToggle<CR>
" mnemonic: Spelling-Spelling
