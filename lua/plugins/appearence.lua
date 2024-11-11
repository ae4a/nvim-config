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
      require('kanagawa').setup({})
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
          theme = require("plugins.lualine.kanagawa"),
          component_separators = { left = '|', right = '|'},
          section_separators = { left = '', right = ''},
          globalstatus = true,
        }
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true
            },
          },
          color_icons = true,
        },
      }
    end,
  },
  {
    "moll/vim-bbye"
  }, -- For right buffer close
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signcolumn = false,
        numhl = true,
      }
    end,
  }
}