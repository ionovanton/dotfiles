local opts = {
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"

require("nvim-autopairs").setup(opts)
require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
