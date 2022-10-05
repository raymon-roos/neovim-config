require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  -- ensure_installed = {
  -- 'bash', 'c', 'css', 'html', 'javascript', 'json', 'lua', 'vim', 'php',
  -- },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "latex" },

  -- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = vim.fn.stdpath('data') .. "/site/treesitter-parsers",
  -- vim.opt.runtimepath:append(vim.fn.stdpath('data') .. "site/treesitter-parsers"),

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "latex" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --   local max_filesize = 300 * 1024 -- 100 KB
    --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --   if ok and stats and stats.size > max_filesize then
    --     return true
    --   end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
}
