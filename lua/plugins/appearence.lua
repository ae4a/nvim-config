return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        overrides = function(colors)
          return {
            SnacksIndentScope = { fg = colors.theme.ui.special }, -- Do not like the default one
          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', "rebelot/kanagawa.nvim" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = require("plugins.lualine.kanagawa-nvim"),
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
        }
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      float_opts = {
        border = 'curved',
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signcolumn = false,
        numhl = true,
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }
}
