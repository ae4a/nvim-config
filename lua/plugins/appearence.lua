return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "feline-nvim/feline.nvim",
    config = function()
      local ctp_feline = require('catppuccin.groups.integrations.feline')

      ctp_feline.setup()
          
      require("feline").setup({
          components = ctp_feline.get(),
      })
    end,
  }
}