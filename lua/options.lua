local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command
local augroup = vim.api.nvim_create_augroup

local set_vim_opts = function(t)
  for k, v in pairs(t) do
    vim.opt[k] = v
  end
end

local tlc_toggle_func = function()
	local tlc_on = {
		tab = '→ ',
		lead = '⋅',
		eol = '↴',
	}

	local tlc_off = {
		tab = '',
		lead = '',
		eol = '',
	}

	if (tlc_toggle == false) then
		vim.opt[listchars] = tlc_on
		tlc_toggle = true
	else
		vim.opt[listchars] = tlc_off
		tlc_toggle = false
	end
end

vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,h,l,[,]" -- wrap move to the next line

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
  expandtab = true, -- convert tabs to spaces
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
		pattern = { '*.xml', '*.html', '*.xhtml', '*.css', '*.scss', '*.javascript', '*.typescript', '*.yaml', '*.lua' },
    vim_opts = {
      expandtab = true,
      shiftwidth = 8,
      tabstop = 8,
    },
    callback = function()
      print("this peace of crap doesnt work for some reason")
    end,
	},
}

-- Execute
set_vim_opts(default_opts)

for _, t in ipairs(custom_opts) do
  if (t.default == false) then
    autocmd(t.name, {
      group = t.group,
      pattern = t.pattern,
      callback = t.callback
    })
  end
end


