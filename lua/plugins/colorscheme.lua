return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        overrides = function(colors)
          return {
            SnacksIndentScope = { fg = colors.theme.ui.special }, -- Do not like the default one
          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
