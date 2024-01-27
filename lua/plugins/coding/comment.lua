return {
  'numToStr/Comment.nvim',
  event = "VeryLazy",
  opts = {
    marker_padding = true,                -- Linters prefer comment and line to have a space in between markers
    comment_empty = false,                -- should comment out empty or whitespace only lines
    comment_empty_trim_whitespace = true, -- trim empty comment whitespace
    create_mappings = true,               -- Should key mappings be created
    line_mapping = "gcc",                 -- Normal mode mapping left hand side
    operator_mapping = "gc",              -- Visual/Operator mapping left hand side
    comment_chunk_text_object = "ic",     -- text object mapping, comment chunk,,
    hook = nil                            -- Hook function to call before commenting takes place
  }
}
