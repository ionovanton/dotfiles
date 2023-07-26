local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command
local augroup = vim.api.nvim_create_augroup

local set_vim_opts = function(t)
  for k, v in pairs(t) do
    vim.opt[k] = v
  end
end

-- I don't know what this one does
vim.opt.shortmess:append "c"

-- Wrap move to the next line
vim.cmd "set whichwrap+=<,>,h,l,[,]"

-- Disable autocomment on next line for all buffers
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Smart hungry backspace
-- TODO


-- Default vim options
local default_opts = {
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
  list = true,
  termguicolors = true,
  showtabline = 2, -- show opened tabs (pages) on top of the screen
  expandtab = true, -- convert tabs to spaces when pressed
  shiftwidth = 2,
  tabstop = 2,
}

-- Option overriding
augroup("LanguageSettings", {})
augroup("ProjectSettings", {})

local custom_opts = {
  {
    name = "FileType",
    group = "LanguageSettings",
    default = false,
    pattern = "lua",
    callback = function(_)
      local vim_opts = {
        expandtab = true,
        shiftwidth = 2,
        tabstop = 2,
      }
      for k, v in pairs(vim_opts) do
        vim.opt[k] = v
      end
    end,
  },
}

-- Default options
set_vim_opts(default_opts)

-- Custom options
for _, t in ipairs(custom_opts) do
  if (t.default == false) then
    autocmd(t.name, {
      group = t.group,
      pattern = t.pattern,
      callback = t.callback,
    })
  end
end

