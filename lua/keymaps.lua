local opts = { noremap = true, silent = true }

-- Disable arrow keys
keymap("i", "<Up>", "<Nop>", opts)
keymap("i", "<Left>", "<Nop>", opts)
keymap("i", "<Down>", "<Nop>", opts)
keymap("i", "<Right>", "<Nop>", opts)
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

-- Clear highlights
keymap("n", "<Esc>", ":noh <CR>", opts)

-- Shift text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move in insert mode
keymap("i", "<C-h>", "<C-o>h", opts)
keymap("i", "<C-j>", "<C-o>j", opts)
keymap("i", "<C-k>", "<C-o>k", opts)
keymap("i", "<C-l>", "<C-o>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Move text up and down
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Move text horizontally
keymap("v", "<A-l>", "xp`[v`]", opts)
keymap("v", "<A-h>", "xhhp`[v`]", opts)
keymap("n", "<A-l>", "vixp`[v`]", opts)
keymap("n", "<A-h>", "vixhhp`[v`]", opts)
keymap("i", "<A-l>", "<Esc>viwxp`[v`]", opts)
keymap("i", "<A-h>", "<Esc>viwxhhp`[v`]", opts)

-- Test
keymap("n", "<leader>ttt", function() require("test") end, opts)
