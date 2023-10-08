-- require("luasnip.loaders.from_vscode")

local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local i = ls.insert_node

ls.config.set_config {
  updateevents = "TextChanged,TextChangedI",
}

-- TODO: cmp doesn't suggest any snippets from luasnip
ls.snippets = {
  cpp = {
    ls.parser.parse_snippet("sfnc", "$1 $2\n{\n$0\n}\n")
  },
  lua = {
    ls.parser.parse_snippet("req", "local {} = require('{}')", { i(1), rep(1) }),
    ls.parser.parse_snippet("abc", "abc")
  }
}

-- Keymaps
vim.keymap.set({ "i", "s", }, "<C-l>", function()
  if ls.expand_or_jumpable then
    ls.expand_or_jump()
  end
end, { silent = true, })
vim.keymap.set({ "i", "s", }, "<C-h>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true, })
vim.keymap.set({ "i", "s", }, "<C-tab>", function()
  if ls.choice_active then
    ls.change_choice(1)
  end
end)
vim.keymap.set("n", "<leader><leader>ls", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
