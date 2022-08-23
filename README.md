## Welcome to my Neovim configuration 

I use vim for writing prose in LaTeX and zettelkasten notes in Markdown, and recently I
have been working on setting up LSP server integration, for supplying auto-completion and
diagnostics, to use in coding projects. It is very much still a work in progress and of
poor quality. 

### Zettelkasten in vanilla Neovim

Copied largely from [this excellent blog post
series](https://www.edwinwenink.xyz/posts/42-vim_notetaking/). Notes (zettels) I make are
small, covering a single subject and are all stored together in a single flat directory
and are linked to other relevant notes through file links, making use of filename
completion. Filenames get a timestamp appended on creation, so they can be manipulated
programmatically in the future. The tag system is build on universal-c-tags, which
integrates into vim natively. 

