local opts = {
  backup = false,
  swapfile = false,
  undofile = true,
  clipboard = "unnamedplus",
  number = true,
  completeopt = { "menuone", "noselect", },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "",
  pumheight = 10,
  showmode = false,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  timeoutlen = 500,
  writebackup = false,
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
  termguicolors = true,
  -- showtabline = 2,
  -- expandtab = true,
  -- shiftwidth = 2,
  -- tabstop = 2,
}

vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,h,l,[,]" -- wrap move to the next line

for k, v in pairs(opts) do
  vim.opt[k] = v
end
