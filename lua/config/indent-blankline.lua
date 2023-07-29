require("indent_blankline").setup{
  show_end_of_line = true,
  space_char_blankline = " ",
  show_current_context = true,
}

vim.cmd "highlight IndentBlanklineChar guifg=Whitespace gui=nocombine"
vim.cmd "highlight IndentBlanklineSpaceChar guifg=Whitespace gui=nocombine"

