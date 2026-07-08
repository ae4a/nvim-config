return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = { left = "|", right = "|" }
      opts.options.section_separators = { left = "", right = "" }
      -- remove time, put line/column in the rightmost section
      -- so it gets the same section color as the time had
      opts.sections.lualine_b = { "branch", "diff" }

      opts.sections.lualine_x = {
        {
          function()
            return require("noice").api.status.command.get()
          end,
          cond = function()
            return package.loaded["noice"] and require("noice").api.status.command.has()
          end,
        },
        {
          function()
            return require("noice").api.status.mode.get()
          end,
          cond = function()
            return package.loaded["noice"] and require("noice").api.status.mode.has()
          end,
        },
      }
      opts.sections.lualine_y = { "progress" }
      opts.sections.lualine_z = {  "location" }
    end,
  },
}
