return {
  on_attach = function(_, bufnr)
    require('utils.lsp_on_attach')(_, bufnr)
    require('ltex-utils').on_attach(bufnr)
  end,
  filetypes = {
    'bib', 'gitcommit', 'markdown', 'md', 'org', 'plaintex', 'rst', 'rnoweb', 'tex', 'pandoc', 'quarto', 'rmd',
    'context'
  },
  settings = {
    ltex = {
      language = 'en-GB',
      diagnosticSeverity = 'information',
      additionalRules = {
        enablePickyRules = true,
      },
      disabledRules = {
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
