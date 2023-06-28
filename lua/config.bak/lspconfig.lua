local mason = require "mason"
local lspconfig = require "lspconfig"
local util = require "lspconfig.util"
local gopls = require "config.gopls"

local on_attach = function(_, _)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
end

mason.setup()

lspconfig.gopls.setup(gopls)

