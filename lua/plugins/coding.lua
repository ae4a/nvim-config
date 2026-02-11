return {
  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup({
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true,
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    opt = true, -- Set this to true if the plugin is optional
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function() require("nvim-ts-autotag").setup({}) end,
  },
  -- {
  --   "mg979/vim-visual-multi",
  --   branch = "master",
  --   init = function()
  --     vim.g.VM_maps = {
  --       ["Add Cursor Down"] = "<C-j>",
  --       ["Add Cursor Up"] = "<C-k>",
  --     }
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup({
        formatters = {
          sqlfluff = {
            args = {
              "format",
              "--dialect",
              "postgres",
              "--config",
              ".sqlfluff",
              --"--stdin",
              "-",
            },
            command = "sqlfluff",
            stdin = true,
          },
        },

        formatters_by_ft = {
          sql = { "sqlfluff" },
          swift = { "swiftformat" },
          -- ['pgsql'] = { "sqlfluff" },
          -- ['sqldml'] = { "sqlfluff" },
        },

        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  },
  { "wakatime/vim-wakatime", lazy = false },
}
