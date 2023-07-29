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

local go_to_main_window = require("utils").go_to_main_window
local debug_log = require("utils").debug_log
local wrap = require("utils").wrap

-- Switch between buffers
keymap("n", "<S-l>",
function()
  if (vim.o.filetype == "NvimTree") then
    go_to_main_window()
    return "<cmd><CR>"
  end
  return ":bnext<CR>"
end, {silent = true, expr = true})
keymap("n", "<S-h>",
function()
  if (vim.o.filetype == "NvimTree") then
    go_to_main_window()
    return "<cmd><CR>"
  end
  return ":bprevious<CR>"
end, {silent = true, expr = true})

-- Close buffers
keymap("n", "<leader>bcc", ":bd % | :bnext<CR>", opts)
keymap("n", "<leader>bca", ":bd % | :BufferLineCloseOthers<CR>", opts)
keymap("n", "<leader>bco", ":BufferLineCloseOthers<CR>", opts)
keymap("n", "<leader>bcr", ":BufferLineCloseRight<CR>", opts)
keymap("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", opts)
-- keymap("n", "<leader>bcu", ":bdelete %<CR>; :bnext<CR>", opts) -- TODO: close unchanged
