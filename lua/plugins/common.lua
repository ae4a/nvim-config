return {
  --{
  --  "nvim-tree/nvim-tree.lua",
  --  config = function()
  --    require("nvim-tree").setup()
  --  end,
  --},
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require('neo-tree').setup({
        enable_diagnostics = true,
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            show_hidden_count = false,
          }
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
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
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
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require("cmake-tools").setup({
        cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }
      })
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      -- dashboard = { enabled = true },
      -- explorer = { enabled = true },
      indent = {
        enabled = true,
        animate = {
          enabled = false,
        },
      },
      -- input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      scroll = {
        enabled = true,
        animate = {
          duration = {
            total = 50,
          },
        },
      },
      lazygit = {
        enabled = true,
      },
      win = {
        --position = "floating",
        border = "rounded",
        --backdrop = 90,
      },
      terminal = {
        enabled = true,
        win = {
          style = "float",
          --backdrop = 90,
        },
      },
      -- words = { enabled = true },
    },
  },
  {
    'nvim-mini/mini.pairs',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end,
  },
  {
    'nvim-mini/mini.ai',
    version = '*',
    config = function()
      require('mini.ai').setup()
    end,
  },
  {
    'nvim-mini/mini.move',
    version = '*',
    config = function()
      require('mini.move').setup()
    end,
  },
  {
    'nvim-mini/mini.comment',
    version = '*',
    config = function()
      require('mini.comment').setup()
    end,
  },
  {
    'abecodes/tabout.nvim',
    lazy = false,
    config = function()
      require('tabout').setup {
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true,
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp"
    },
    opt = true,  -- Set this to true if the plugin is optional
    event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
}
