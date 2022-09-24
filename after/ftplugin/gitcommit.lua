-- Completion for commit keyword conventions (i.e. Feat. Refactor etc)
require'cmp'.setup.buffer {
  sources = require'cmp'.config.sources(
    {{ name = 'conventionalcommits' }},
    {{ name = 'buffer' }}
  ),
}
