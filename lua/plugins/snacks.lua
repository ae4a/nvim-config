return {
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
}
