return {
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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
    config = function()
      require('neo-tree').setup({
        enable_diagnostics = true,
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            show_hidden_count = false,
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
        },
        source_selector = {
          winbar = false,
        },
        default_component_configs = { -- Fixes some icons
          diagnostics = {
            symbols = {
              hint = "󰰂 ",
              info = " ",
              warn = " ",
              error = " ",
            },
          },
          git_status = {
            symbols = {
              added = "",
              -- -- Status type
              -- untracked = "",
              -- ignored = "",
              -- unstaged = "󰄱",
              -- staged = "",
              -- conflict = "",
            },
          },
          modified = {
            symbol = "󰦒 ",
            highlight = "NeoTreeModified",
          },
        },
        window = {
          width = 33,
        }
      })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },
    opts = {
      grep = {
        hidden = true,
      }
    }
  },
}
