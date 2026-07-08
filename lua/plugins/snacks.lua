return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        position = "float",
      },
    },
    scroll = {
      enabled = true,
      animate = {
        duration = {
          total = 50,
        },
      },
    },
    indent = {
      animate = {
        enabled = false,
      },
    },
    lazygit = {
      enabled = true,
    },
  },
  keys = {
    {
      "<C-l>",
      function()
        Snacks.lazygit()
      end,
      mode = { "n", "t" },
      desc = "Toggle LazyGit (Root)",
    },
  },
}
