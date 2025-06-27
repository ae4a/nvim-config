return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },
    opts = {}
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
      -- words = { enabled = true },
    },
  },
}
