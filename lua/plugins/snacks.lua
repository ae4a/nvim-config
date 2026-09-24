local floatMgr = require("util.float-mgr")

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
      floatMgr.wrap(function()
        return Snacks.terminal(nil, {
          win = {
            border = "rounded",
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
      end),
      mode = { "n", "t" },
      desc = "Toggle LazyGit (Root)",
    },
    {
      "<C-l>",
      floatMgr.wrap(function()
        return Snacks.lazygit({
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
      end),
      mode = { "n", "t" },
      desc = "Toggle LazyGit (Root)",
    },
  },
}
