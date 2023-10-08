require("toggleterm").setup()
local terminal = require('toggleterm.terminal').Terminal
local go_to_main_window = require("utils").go_to_main_window

-- Lazygit
local lazygit = terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})

function toggleterm_lazygit()
  lazygit:toggle()
end

keymap("n", "<leader>gg", "<cmd>keepjumps lua toggleterm_lazygit()<CR>", { noremap = true, silent = true })

-- GDB
local gdb = terminal:new({
  cmd = "gdb -tui a.out", -- TODO: pass executable
  hidden = true,
  direction = "float",
})

function toggleterm_gdb()
  gdb:toggle()
end

-- keymap("n", "<leader>gdb", "<cmd>keepjumps lua toggleterm_gdb()<CR>", { noremap = true, silent = true })

-- Bottom terminal
local bind_bottom_terminal = "<C-t>"
local bottom_terminal = terminal:new({
  hidden = true,
  direction = "horizontal",
})

function bottom_terminal_toggle()
  bottom_terminal:toggle()
end

bottom_terminal_toggle_cmd = "<cmd>keepjumps lua bottom_terminal_toggle()<CR>"
vim.keymap.set("n", bind_bottom_terminal, bottom_terminal_toggle_cmd, { noremap = true, silent = true, })

-- Floating terminal
local bind_floating_terminal = "<C-y>"
local floating_terminal = terminal:new({
  hidden = true,
  direction = "float",
})

function floating_terminal_toggle()
  floating_terminal:toggle()
end

floating_terminal_toggle_cmd = "<cmd>keepjumps lua floating_terminal_toggle()<CR>"
keymap("n", bind_floating_terminal, floating_terminal_toggle_cmd, { noremap = true, silent = true })

function set_toggleterm_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", bind_bottom_terminal, "<Esc>" .. bottom_terminal_toggle_cmd, opts)
  vim.keymap.set("t", bind_floating_terminal, "<Esc>" .. floating_terminal_toggle_cmd, opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://*toggleterm#* keepjumps lua set_toggleterm_keymaps()")
