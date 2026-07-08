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
      "<C-_>",
      function()
        vim.notify("fuck2")
        Snacks.terminal(nil, {
          cwd = LazyVim.root(),
          win = {
            keys = {
              nav_h = false,
              nav_j = false,
              nav_k = false,
              nav_l = false,
              hide_slash = false,
              hide_underscore = false,
            },
          },
        })
      end,
      mode = { "n", "t" },
      desc = "Toggle LazyGit (Root)",
    },
    {
      "<C-l>",
      function()
        vim.notify("fuck1")
        Snacks.lazygit({
          win = {
            keys = {
              nav_h = false,
              nav_j = false,
              nav_k = false,
              nav_l = false,
              hide_slash = false,
              hide_underscore = false,
            },
          },
        })
      end,
      mode = { "n", "t" },
      desc = "Toggle LazyGit (Root)",
    },
  },
}
