local opts = {
  on_attach = on_attach,
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = function(fname)
    return util.root_pattern('go.work', 'go.mod', '.git')(fname)
  end,
  single_file_support = true,
  settings = {},
}

return opts
