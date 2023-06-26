local keymap = vim.keymap.set

local plugins = {
  {
    "nvim-tree/nvim-web-devicons",
    name = "nvim-web-devicons",
  },
  {
    "rafamadriz/friendly-snippets",
    name = "friendly-snippets",
  },
  {
    "L3MON4D3/LuaSnip",
    name = "luasnip",
    lazy = true,
    dependencies = "friendly-snippets",
    opts = function()
      return require "config.luasnip"
    end,
    config = function(_, opts)
      require("luasnip").setup(opts)
    end,
  },
  {
    "windwp/nvim-autopairs",
    name = "autopairs",
    opts = function()
      return require "config.autopairs"
    end,
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    -- name  = "nvim-cmp",
    -- event = "InsertEnter",
    -- lazy = true,
    dependencies = {
      "luasnip",
      "autopairs",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
      return require "config.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return require "config.catppuccin"
    end,
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = function()
      return require "config.catppuccin"
    end,
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = function()
      return require "config.lazyvim"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function()
      return require "config.mason"
    end,
    build = ":MasonUpdate",
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = function()
      return require "config.nvimtree"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "config.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return require "config.telescope"
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    tag = "0.1.1",
  },
  {
    "akinsho/bufferline.nvim",
    opts = function()
      return require "config.bufferline"
    end,
  },
  {
    "sindrets/diffview.nvim",
    opts = function()
      return require "config.diffview"
    end,
    dependencies = {
      "nvim-web-devicons",
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require "config.gitsigns"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return require "config.lualine"
    end,
    config = function(_, opts)
      return require("lualine").setup(opts)
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function()
      return require "config.blankline"
    end,      
  },
  {
    "kylechui/nvim-surround",
    opts = function()
      return require "config.surround"
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-web-devicons",
    },
    opts = function()
      return require "config.trouble"
    end,
    config = function(_, opts)
      return require("trouble").setup(opts)
    end,
  },
}

return plugins
