local opts = {
  default_config = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_dir = function(fname)
      return util.root_pattern('go.work', 'go.mod', '.git')(fname)
    end,
    single_file_support = true,
  },
  docs = {
    default_config = {
      root_dir = [[root_pattern("go.work", "go.mod", ".git")]],
    },
  },
}

return opts