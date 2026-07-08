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
  },
  keys = {
    {
      "<C-/>",
      function()
        Snacks.terminal.toggle(nil, { cwd = LazyVim.root() })
      end,
      mode = { "n", "t" },
      desc = "Toggle terminal (Root Dir)",
    },
    {
      "<C-l>",
      function()
        Snacks.terminal({ "lazygit" }, { cwd = LazyVim.root.get() })
      end,
      mode = { "n", "t" },
      desc = "Toggle LazyGit (Root)",
    },
  },
}
