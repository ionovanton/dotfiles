local cmdfmt = require("utils").keymap_command_formatter

require("indent_blankline").setup({
  show_end_of_line = true,
  space_char_blankline = " ",
  show_current_context = true,
})

-- Switch between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

