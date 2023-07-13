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

local function test_f()
  local ft = vim.o.filetype
  if (cmp(ft, "NvimTree")) then
    return -- вернуть переход на правое окно
  end
  return ":bprevious<CR>" -- вернуть обычное поведение
end

-- Switch between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>blcc", ":bdelete %<CR>; :bnext<CR>", opts)
keymap("n", "<leader>dd>", test_f)
