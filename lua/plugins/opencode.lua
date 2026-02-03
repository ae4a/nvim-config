return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function()
      vim.g.opencode_opts = {
        provider = {
          snacks = {
            win = {
              position = "right",
              width = math.floor(vim.o.columns * 0.32),
            },
          },
        },
        ask = {
          prompt = "FUCK: ",
        },
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true
    end,
  },
}
