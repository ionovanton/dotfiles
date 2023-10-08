require("nvim-treesitter.configs").setup({
  run = ":TSUpdate",
  sync_install = false,
  ensure_installed = { "go", },
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
})

