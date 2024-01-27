return {
  'windwp/nvim-ts-autotag',
  event = 'InsertEnter',
  dependencies = 'nvim-treesitter',
  opts = {
    autotag = {
      enable = true,
      filetypes = {
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'svelte',
        'vue',
        'tsx',
        'jsx',
        'rescript',
        'xml',
        'php',
        'blade',
        'blade.php',
        'markdown',
        'astro',
        'glimmer',
        'handlebars',
        'hbs',
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
