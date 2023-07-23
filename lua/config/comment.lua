require("Comment").setup()

local opts = { remap = true, silent = true }

vim.keymap.set('i', '<C-_>', '<Esc>:Commentary<CR>')
vim.keymap.set('n', '<C-_>', 'gcc', opts)
vim.keymap.set('v', '<C-_>', "gcgv", opts)

