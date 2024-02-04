## Welcome to my Neovim configuration

I use vim every day for programming, writing prose in LaTeX, and zettelkasten notes in
Markdown. It has been a lot of work — adding, improving and personalizing the configs
to my liking — but it has been immensely satisfying and very educational.

### Current features in place:

**Plugin management through [lazy.nvim](https://github.com/folke/lazy.nvim).**

I migrated from [packer.nvim](https://github.com/wbthomason/packer.nvim) to lazy.nvim,
because packer.nvim itself appears to be unmaintained and everybody knowns lazy.nvim is
the new hotness. The user experience with lazy is _interesting_. Lazy loading does add
some complexity, but plugin specs and autodiscovery are very neat. My config took a lot if
inspiration from [lazyzim](https://github.com/LazyVim/LazyVim). I wouldn't recommend
people getting started with Neovim to build a config from scratch like this, unless they
specifically care about having ownership of their own config. Lazyvim offers some
additional abstractions and user-facing features, the workings of which I personally
couldn't figure out. Which is why I hand-rolled most things myself, which is also why it's
a lot less elegant.

Approximately one-third of installed plugins are lazily loaded, but the main benifit is
that lazy.nvim can do so without blocking the ui on start up. (_Blazingly fast_ nvim
config, anyone??) It's noticeably faster to the eye at presenting the file with the colour
scheme and status line and other such fluff in place compared to my previous set-up with
Packer. Though the benefit is merely visual, as the whole thing loads faster than my own
reaction time anyway.

-   Pure Lua.
-   [base16](https://github.com/RRethy/nvim-base16) colour scheme, because it integrates
    well with Treesitter and modern UI features. Also has a slightly tweaked
    [gruvbox](https://github.com/ellisonleao/gruvbox.nvim) theme, but it's disabled
    because I've grown tired of _everything_ being either yellow or red.
-   [Lualine](https://github.com/nvim-lualine/lualine.nvim) as a status line.
-   [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for nice syntax
    highlighting and more advanced text objects.
-   Coding quality of life, such as:
    -   Auto complete matching pair while typing (i.e. `{},[],'',"" etc`).
    -   Advanced pair navigation, the '%' key jumps between `function()` and `end`,
        or `if()` and `ifelse()` for example.
    -   Treesitter text objects for functions, classes, loops, and conditionals.
    -   Treesitter indentation guides and scope highlighting.
    -   Surround motions/text objects with parentheses/braces/blocks/quotes and any other
        character, but also HTML tags and function calls.
-   [Git status signs](https://github.com/lewis6991/gitsigns.nvim) in the sign column.
-   [Latex](https://github.com/lervag/vimtex) integration, for navigating, compiling and viewing.
-   [Fuzzy search all the things with Telescope](https://github.com/nvim-telescope/telescope.nvim)
-   [Managing files and directories as buffers](https://github.com/stevearc/oil.nvim),
    a new paradigm compared to file trees. Paired with Telescope, huge web framework
    directory structures seize being a hindrance.
-   [Jumping and telekinesis with Leap](https://github.com/ggandor/leap.nvim).

**LSP features:**

-   General diagnostics: Virtual text, signs, hotkeys for jumping between and viewing
    diagnostics.
-   [Mason](https://github.com/williamboman/mason.nvim) (and lsp-config and
    mason-lspconfig) for easily managing lsp servers.
-   [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) for
    automatically hooking installed mason lsp servers into
    [lsp-config](https://github.com/neovim/nvim-lspconfig)'s setup function.
-   Advanced code completion with snippets and jumping using
    [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and
    [LuaSnip](https://github.com/L3MON4D3/LuaSnip) and many other completion sources.

### Zettelkasten in vanilla vim

Copied largely from [this excellent blog post series](https://www.edwinwenink.xyz/posts/42-vim_notetaking/).
Rewritten in pure Lua, with minor tweaks. Features consist mostly of user commands, tied
to hotkeys. To quickly start a new note for instance, or searching and navigating between
notes. Notes (zettels) I make are small, covering a single subject and are all stored
together in a single flat directory and are linked to other relevant notes through file
links, making use of filename completion. Filenames get a time stamp appended on creation,
so they can be manipulated programmatically in the future. The tag system is build on
[universal-c-tags](https://github.com/universal-ctags/ctags), which integrates into vim
natively.
