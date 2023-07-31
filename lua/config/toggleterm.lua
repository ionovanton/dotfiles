require("toggleterm").setup()
local terminal = require('toggleterm.terminal').Terminal
local go_to_main_window = require("utils").go_to_main_window

-- Lazygit
local lazygit = terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})

function lazygit_toggle()
  lazygit:toggle()
end

keymap("n", "<leader>git", "<cmd>keepjumps lua lazygit_toggle()<CR>", { noremap = true, silent = true })

-- Bottom terminal
local bottom_terminal = terminal:new({
  hidden = true,
  direction = "horizontal",
})

function bottom_terminal_toggle()
  bottom_terminal:toggle()
end

bottom_terminal_toggle_cmd = "<cmd>keepjumps lua bottom_terminal_toggle()<CR>"
vim.keymap.set( "n", "<C-t>", bottom_terminal_toggle_cmd, { noremap = true, silent = true, })

function set_toggleterm_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set( "t", "<esc>", [[<C-\><C-n>]], opts )
  vim.keymap.set( "t", "<C-t>", "<Esc>" .. bottom_terminal_toggle_cmd, opts )
  vim.keymap.set( "t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts )
  vim.keymap.set( "t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts )
  vim.keymap.set( "t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts )
  vim.keymap.set( "t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts )
end

vim.cmd("autocmd! TermOpen term://*toggleterm#* keepjumps lua set_toggleterm_keymaps()")

