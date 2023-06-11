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
    config = function()
      require("catppuccin").setup(
        {
          flavour = "mocha",
          background = {
              light = "latte",
              dark = "mocha",
          },
          transparent_background = false,
          show_end_of_buffer = false,
          term_colors = false,
          dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.15,
          },
          no_italic = false,
          no_bold = false,
          no_underline = false,
          styles = {
              comments = { "italic" },
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = { "bold" },
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
          },
          color_overrides = {},
          custom_highlights = {},
          integrations = {
              cmp = true,
              gitsigns = true,
              nvimtree = true,
              telescope = true,
          }, 
        }
      )
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin"
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "sumneko_lua",
      },
    },
    build = ":MasonUpdate",
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = function()
      return require "config.nvimtree"
    end,
    config = function(_, opts)
      require('nvim-tree').setup(opts)
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
  },
}

return plugins