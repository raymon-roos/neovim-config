require('gruvbox').setup({
  undercurl = true,
  underline = true,
  underlineline = true,
  underdot = true,
  underdash = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = false, -- invert background for search, diffs, statuslines and errors
  contrast = 'hard', -- can be 'hard', 'soft' or empty string
  overrides = {
    String = { italic = true },
    SignColumn = { bg = 'none' },
    FoldColumn = { bg = 'none' },
    GruvboxGreenSign = { bg = 'none' },
    GruvboxRedSign = { bg = 'none' },
    GruvboxBlueSign = { bg = 'none' },
    GruvboxYellowSign = { bg = 'none' },
    GruvboxPurpleSign = { bg = 'none' },
    GruvboxAquaSign = { bg = 'none' },
    GruvboxOrangeSign = { bg = 'none' },
  }
})

vim.cmd.colorscheme 'gruvbox'
