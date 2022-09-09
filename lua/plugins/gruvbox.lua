require("gruvbox").setup({
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
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = 'hard', -- can be "hard", "soft" or empty string
  overrides = {
    String = { italic = false },
    SignColumn = { bg = 'NONE' },
    GruvboxGreenSign = { bg = 'NONE' },
    GruvboxRedSign = { bg = 'NONE' },
    GruvboxBlueSign = { bg = 'NONE' },
    GruvboxYellowSign = { bg = 'NONE' },
    GruvboxPurpleSign = { bg = 'NONE' },
    GruvboxAquaSign = { bg = 'NONE' },
    GruvboxOrangeSign = { bg = 'NONE' },
  }
})

vim.cmd([[ colorscheme gruvbox ]])
