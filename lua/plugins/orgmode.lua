return {
  -- Emac's most popular everything-organizing plain text file type
  'nvim-orgmode/orgmode',
  dependencies = {
    'akinsho/org-bullets.nvim',
    opts = { list = "•", headlines = { "◉", "○", "✸", "✿" } },
  },
  ft = { 'org' },
  event = 'VeryLazy',
  opts = {
    org_agenda_files = '~/files/org/**/*',
    org_default_notes_file = '~/files/org/refile.org',
  },
}
