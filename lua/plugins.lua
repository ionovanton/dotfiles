local keymap = vim.keymap.set

local plugins = {
  {
    "hrsh7th/nvim-cmp",
    -- name  = "nvim-cmp",
    -- event = "InsertEnter",
    -- lazy = true,
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require "config.luasnip"(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "config.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
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
}

return plugins
