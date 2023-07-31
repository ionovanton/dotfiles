require("telescope").setup({
  defaults = {

  },
  pickers = {

  },
})

local opts = { noremap = true, silent = true, }

keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fa", "<cmd>Telescope live_grep<CR>", opts)

