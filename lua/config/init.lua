-- TODO: list all files and require them with for loop

local plugins = {
  "autopairs",
  "bufferline",
  "catppuccin",
  "cmp",
  "comment",
  "indent-blankline",
  "lazygit",
  "lspconfig",
  "lualine",
  "mason",
  "nvim-tree",
  "surround",
  "toggleterm",
  "treesitter",
}

for _, v in ipairs(plugins) do
  require("config." .. v)
end
