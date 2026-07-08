return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- Ensure views table exists
      opts.views = opts.views or {}

      -- Override the cmdline_popup position
      opts.views.cmdline_popup = {
        position = {
          row = "30%", -- Change this percentage to move it up or down (Default is usually much higher)
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      }
    end,
  },
}
