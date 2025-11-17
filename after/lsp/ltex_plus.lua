return {
  on_attach = function(_, bufnr)
    require('utils.lsp_on_attach')(_, bufnr)
    require('ltex_extra').setup({
      load_langs = { 'en-US', 'nl' },
      path = vim.fn.expand('$XDG_DATA_HOME') .. '/ltex',
    })
  end,
  filetypes = {
    'bib', 'gitcommit', 'markdown', 'md', --[[ 'org', ]] 'plaintex', 'rst', 'rnoweb', 'tex', 'pandoc', 'quarto', 'rmd',
    'context'
  },
  autostart = false,
  settings = {
    ltex = {
      language = 'en-GB',
      diagnosticSeverity = 'information',
      additionalRules = {
        enablePickyRules = true,
      },
      disabledRules = {
        -- ['en'] = { 'DASH_RULE', 'EN_QUOTES' },
        ['en-GB'] = { 'DASH_RULE', 'EN_QUOTES' },
        ['en-US'] = { 'DASH_RULE', 'EN_QUOTES' },
      },
      ['ltex-ls'] = {
        logLevel = 'severe',
      },
      completionEnable = true,
    },
  },
}
