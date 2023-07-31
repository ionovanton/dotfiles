local go_to_main_window = require("utils").go_to_main_window
local is_in = require("utils").is_in_table

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
keymap("n", "<C-h>", ":keepjumps<CR><C-w>h", opts)
keymap("n", "<C-j>", ":keepjumps<CR><C-w>j", opts)
keymap("n", "<C-k>", ":keepjumps<CR><C-w>k", opts)
keymap("n", "<C-l>", ":keepjumps<CR><C-w>l", opts)

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
keymap("v", "<A-h>", "xhp`[v`]", opts)

-- Update Mason/Lazy
keymap("n", "<leader>ul", "<cmd>Lazy update<CR>", opts)
keymap("n", "<leader>um", "<cmd>MasonUpdate<CR>", opts)
-- leader ul

-- Jumps only in main window
vim.keymap.set("n", "<A-h>", function()
  local ignore = { "NvimTree", }
  local skip = "<cmd>keepjumps"
  if (is_in(vim.o.filetype, ignore)) then
    return cmd_main_win
  end
  return "<C-o>"
end, { noremap = true, silent = true, expr = true, })
vim.keymap.set("n", "<A-l>", function()
  local ignore = { "NvimTree", }
  local skip = "<cmd>keepjumps"
  if (is_in(vim.o.filetype, ignore)) then
    return cmd_main_win
  end
  return "<C-i>"
end, { noremap = true, silent = true, expr = true, })

-- Toggle charlist
keymap("n", "<leader>tlc", function()
  local tlc_on = {
    tab = '→ ',
    lead = '⋅',
    eol = '↴',
    trail = '⋅',
  }

  local tlc_off = {
    tab = '',
    lead = '',
    eol = '',
    trail = '⋅',
  }

  if (tlc_toggle == false) then
    vim.opt["listchars"] = tlc_on
    tlc_toggle = true
  else
    vim.opt["listchars"] = nil
    tlc_toggle = false
  end
end, { noremap = true, silent = true })

-- Debug
keymap("n", "<leader>dbgwl", function()
  local wins = vim.api.nvim_list_wins()
  local result = ""
  for _, v in ipairs(wins) do
    result = v .. " " .. result
  end
  print(result)
end, { noremap = true, expr = true, })

-- Test
keymap("n", "<leader>ttt", function()
  vim.cmd ""
end, { noremap = true, expr = true, })

