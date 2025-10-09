return {
  -- Emac's most popular everything-organizing plain text file type
  'nvim-orgmode/orgmode',
  dependencies = {
    'akinsho/org-bullets.nvim',
    opts = { list = "•", headlines = { "◉", "○", "✸", "✿" } },
  },
  ft = { 'org' },
  lazy = true,
  opts = {
    org_agenda_files = '~/files/org/**/*',
    org_agenda_start_on_weekday = false,
    org_todo_keywords = { 'TODO(t)', 'APPOINTMENT', 'MEETING', 'EVENT', '|', 'DONE', 'CANCELED' },
    org_default_notes_file = '~/files/org/refile.org',
    org_time_stamp_rounding_minutes = 1,
  },
}
