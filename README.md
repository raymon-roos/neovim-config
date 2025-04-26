### Sample of installed plugins

- Plugin management through [lazy.nvim](https://github.com/folke/lazy.nvim).
- [base16](https://github.com/RRethy/nvim-base16) colour scheme, because it integrates
  well with Treesitter and modern UI features.
- [Lualine](https://github.com/nvim-lualine/lualine.nvim) as a status line.
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for nice syntax
  highlighting and more advanced text objects.
- Coding quality of life, such as:
  - Auto complete matching pair while typing (i.e. `{},[],'',"" etc`).
  - Advanced pair navigation, the '%' key jumps between `function()` and `end`,
    or `if()` and `ifelse()` for example.
  - Treesitter text objects for functions, classes, loops, and conditionals.
  - Treesitter indentation guides and scope highlighting.
  - Surround motions/text objects with parentheses/braces/blocks/quotes and any other
    character, but also HTML tags and function calls.
- [Conform for external formatters](https://github.com/stevearc/conform.nvim)
- [nvim-lint for external linters](https://github.com/mfussenegger/nvim-lint)
- [neotest for running tests](https://github.com/nvim-neotest/neotest)
- [lazydev for nvim API completion and hover docs](https://github.com/folke/lazydev.nvim)
- [Git status signs](https://github.com/lewis6991/gitsigns.nvim) in the sign column.
- [git-conflict](https://github.com/akinsho/git-conflict.nvim) to highlight git conflict
  markers and provide commands for easily picking a resolution.
- [Latex](https://github.com/lervag/vimtex) integration, for navigating, compiling and viewing.
- [Fuzzy search all the things with Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Managing files and directories as buffers](https://github.com/stevearc/oil.nvim),
  a new paradigm compared to file trees. Paired with Telescope, huge web framework
  directory structures seize being a hindrance.
- [Jumping and telekinesis with Leap](https://github.com/ggandor/leap.nvim).
- [nvim-surround](https://github.com/kylechui/nvim-surround) the missing
  surround-the-given-region operation
- Code completion ~~[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)~~
  [blink.cmp](https://github.com/Saghen/blink.cmp) the new shiny go-to completion plugin.
  Actually feels faster, and a lot nicer to set up.
  With snippets using [LuaSnip](https://github.com/L3MON4D3/LuaSnip).
- General diagnostics: Virtual text, signs, hotkeys for jumping between and viewing
  diagnostics.
- ~~[Mason](https://github.com/williamboman/mason.nvim) (and lsp-config and
  mason-lspconfig) for easily managing lsp servers.~~
- ~~[Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) for
  automatically hooking installed mason lsp servers into lsp-config~~
  I dropped Mason, in favour of installing my linters/formatters/LSPs through my system's
  package manager, because [Nix](https://github.com/NixOS/nix) is just that good.
  Did wonders for simplifying my lsp setup.
- [lsp-config](https://github.com/neovim/nvim-lspconfig) for sane default configurations for
  many LSP servers.
- [tiny-inline-diagnostic](https://github.com/rachartier/tiny-inline-diagnostic.nvim)
  for improved virtual text diagnostic messages.

**... and more**

### Zettelkasten in vanilla vim

Copied largely from [this excellent blog post series](https://www.edwinwenink.xyz/posts/42-vim_notetaking/).
Rewritten in pure Lua, with minor tweaks. Features consist mostly of user commands, tied
to hotkeys. To quickly start a new note for instance, or searching and navigating between
notes. Notes I make are small, covering a single subject and are all stored together in
a single flat directory and are linked to other relevant notes through file links, making
use of filename completion. Filenames get a timestamp appended on creation, so they can be
manipulated programmatically in the future. The tag system is build on
[universal-c-tags](https://github.com/universal-ctags/ctags), which integrates into vim
natively.
