local lspconfig = require "lspconfig"
local gopls_opts = require "lsp.gopls"

lspconfig.gopls.setup(gopls_opts)
