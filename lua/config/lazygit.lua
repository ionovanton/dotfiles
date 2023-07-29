local terminal = require('toggleterm.terminal').Terminal
local lazygit = terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})

function lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>git", "<cmd>lua lazygit_toggle()<CR>", {noremap = true, silent = true})
