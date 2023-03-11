## Welcome to my Neovim configuration 

I use vim every day for programming, writing prose in LaTeX, and zettelkasten notes in
Markdown. It has been a lot of work — adding, improving and personalizing the configs
to my liking — but it has been immensely satisfying and very educational. 

### Current features in place: 

- Pure Lua.
- Plugin management through Packer, with autoloading (though currently autoloads 
  practically all plugins regardless, considering most manage themselves anyway. 
  _Blazingly fast_ nvim config, anyone??).
- base16 colorscheme, because it integrates well with Treesitter and modern UI features. 
  Also a slightly tweaked gruvbox theme, but it's disabled because I've grown tired of 
  _everything_ being yellow or red.
- Lualine as a status line plugin.
- Treesitter for nice syntax highlighting and more advanced text objects.
- Coding quality of life, such as:
    - Auto complete matching pair while typing (i.e. `{},[],'',"" etc`).
    - Advanced pair navigation, the '%' key jumps between `function()` and `end`,
      or `if()` and `ifelse()` for example. 
    - Treesitter text objects for functions, classes, loops, and conditionals.
    - Treesitter indentation guides and scope highlighting.
    - surround motions/text objects with parens/braces/blocks/quotes and any other 
      character, but also html tags and function calls.
- Git status signs in the signcolumn
- Latex (non-lsp) integration, for navigating, compiling and viewing.

**LSP features:**
- General diagnostics: Virtual text, signs, hotkeys for jumping between and viewing 
  diagnostics.
- Mason (and mason-lspconfig and lsp-config) for easily managing lsp servers.
- Mason-lspconfig for automatically hooking installed mason lsp servers into
  lsp-config's setup function.
- Advanced code completion with snippets and jumping using nvim-cmp and LuaSnip.

### Zettelkasten in vanilla vim

Copied largely from [this excellent blog post 
series](https://www.edwinwenink.xyz/posts/42-vim_notetaking/). Rewritten in pure Lua, with 
minor tweaks. Features consist mostly of user commands, tied to hotkeys. To quickly start 
a new note for instance, or searching and navigating between notes. Notes (zettels) I make 
are small, covering a single subject and are all stored together in a single flat 
directory and are linked to other relevant notes through file links, making use of 
filename completion. Filenames get a timestamp appended on creation, so they can be 
manipulated programmatically in the future. The tag system is build on universal-c-tags, 
which integrates into vim natively.
