require("bufferline").setup({
  options = {
    diagnostics = "nvim-lsp",
    show_tab_indicators = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      },
    },
    indicator = {
      style = "none",
    },
    color_icons = true,
    show_buffer_icons = true,
  },
})

local is_in = require("utils").is_in_table

-- Switch between buffers
keymap("n", "<S-l>",
  function()
    local ignore = { "NvimTree", "help", }
    if (is_in(vim.o.filetype, ignore)) then
      return cmd_main_win
    end
    return "<cmd>bnext<CR>"
  end, { silent = true, expr = true })
keymap("n", "<S-h>",
  function()
    local ignore = { "NvimTree", "help", }
    if (is_in(vim.o.filetype, ignore)) then
      return cmd_main_win
    end
    return "<cmd>bprevious<CR>"
  end, { silent = true, expr = true })

-- Close buffers
keymap("n", "<leader>bcc", ":bd % | :bnext<CR>", opts) -- TODO: if this is the last buffer in window, do nothing
keymap("n", "<leader>bco", ":BufferLineCloseOthers<CR>", opts)
keymap("n", "<leader>bcr", ":BufferLineCloseRight<CR>", opts)
keymap("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", opts)
-- keymap("n", "<leader>bcu", ":bdelete %<CR>; :bnext<CR>", opts) -- TODO: close unchanged
