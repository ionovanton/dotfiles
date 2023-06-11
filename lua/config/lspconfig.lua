mason = require "mason"
lspconfig = require "lspconfig"
util = lspconfig.util

local on_attach = function(_, _)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
end

local opts = {
  ["gopls"] = 
  {
    on_attach = on_attach,
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_dir = function(fname)
      return util.root_pattern('go.work', 'go.mod', '.git')(fname)
    end,
    single_file_support = true,
    settings = {},
  },
}

mason.setup()
lspconfig.gopls.setup(opts.gopls)

