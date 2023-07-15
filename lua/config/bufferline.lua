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

local debug_log = require("utils").debug_log
local wrap = require("utils").wrap

local resolve = function(cmd)
  ft = vim.o.filetype
  debug_log(ft)
  if (ft == "NvimTree") then
    debug_log("resolve :blast<CR>")
    return "\":blast<CR>\""
  end
  debug_log("resolve ")
  return cmd
end

-- Switch between buffers
keymap("n", "<S-l>", function()
  if (vim.o.filetype == "NvimTree") then
    return ":blast<CR>"
  end
  return ":bnext<CR>"
end, {silent = true, expr = true})
keymap("n", "<S-h>", function()
  if (vim.o.filetype == "NvimTree") then
    return ":blast<CR>"
  end
  return ":bprevious<CR>"
end, {silent = true, expr = true})
keymap("n", "<leader>bcc", ":bdelete %<CR>; :bprevious<CR>", opts)
keymap("n", "<leader>bco", ":bdelete %<CR>; :bnext<CR>", opts)
-- keymap("n", "<leader>bcr", ":bdelete %<CR>; :bnext<CR>", opts)
-- keymap("n", "<leader>bcl", ":bdelete %<CR>; :bnext<CR>", opts)
-- keymap("n", "<leader>bcu", ":bdelete %<CR>; :bnext<CR>", opts)

-- nvix...