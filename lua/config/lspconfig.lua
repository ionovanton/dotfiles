mason = require "mason"
lspconfig = require "lspconfig"
util = require "lspconfig.util"
gopls = require "config.gopls"

local on_attach = function(_, _)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
end

mason.setup()

lspconfig.gopls.setup(gopls)

