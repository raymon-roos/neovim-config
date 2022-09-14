## Welcome to my Neovim configuration 

I use vim for writing prose in LaTeX and zettelkasten notes in Markdown, and recently
I have been working on setting up LSP server integration, for supplying autocompletion and
diagnostics to use in coding projects, as well as converting my old vimL configs into pure
lua. It is very much still a work in progress and of poor quality, but improving with
every commit. 

### Current features in place: 

- Packer plugin managemnt, with autoloading (though currently autoloads
  practically all plugins regardless, considering most manage themselves anyway.
   _Blazingly fast_ nvim config, anyone??).
- Awesome (lua based) gruvbox theme, with slight tweaks
- Lualine as a status line plugin. 
- Visual indentation guides.
- Auto complete matching pair while typing (i.e. `{},[],'',"" etc`).
- Advanced pair navigation, the '%' key jumps between `function()` and `end`,
  or `if()` and `ifelse()` for example. 
- Git status signs in the signcolumn (Slightly modified the Gruvbox theme for
  a nicer signcolumn).
- Diagnostic status sign in the signcolumn, virtue of lsp.
- Latex (non-lsp) integration, for navigating, compiling and viewing.

**LSP features:**
- General diagnostics: Virtual text, signs, hotkeys for jumping between and
  viewing said diagnostics.   
- Mason (and mason-lspconfig and lsp-config) for easily managing lsp servers. 
- Mason-lspconfig for automatically hooking installed mason lsp servers into
  lsp-config's setup function. 
- Advanced code completion with snippets and jumping using nvim-cmp and LuaSnip.

### Zettelkasten in vanilla vim

Copied largely from [this excellent blog post
series](https://www.edwinwenink.xyz/posts/42-vim_notetaking/). Currently merely
a said of viml commands, called with `vim.exec()`, not yet converted to lua.
Notes (zettels) I make are small, covering a single subject and are all stored
together in a single flat directory and are linked to other relevant notes
through file links, making use of filename completion. Filenames get
a timestamp appended on creation, so they can be manipulated programmatically
in the future. The tag system is build on universal-c-tags, which integrates
into vim natively. 

