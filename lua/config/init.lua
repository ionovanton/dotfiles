-- TODO: list all files and require them with for loop

local plugins = {
  "autopairs",
  "bufferline",
  "catppuccin",
  "cmp",
  "comment",
  "ibl",
  "lspconfig",
  "lualine",
  "luasnip",
  "mason",
  "nvim-tree",
  "surround",
  "telescope",
  "toggleterm",
  "treesitter",
}

for _, v in ipairs(plugins) do
  require("config." .. v)
end
