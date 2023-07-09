local opts = {
  backup = false,
  clipboard = "unnamedplus",
  number = true,
  completeopt = { "menuone", "noselect", },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  timeoutlen = 500,
  undofile = true,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  listchars = {
    tab = '→ ',
    lead = '⋅',
    eol = '↴',
  },
  list = true,
  termguicolors = true, -- for bufferline for some reason...
}

vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,h,l,[,]" -- wrap move to the next line

for k, v in pairs(opts) do
  vim.opt[k] = v
end
