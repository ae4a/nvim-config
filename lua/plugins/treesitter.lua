return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    config = function()
      local configs = require("nvim-treesitter")

      require("nvim-treesitter.install").compilers = { "clang" }

      configs.setup({
        ensure_installed = {
          "swift",
          "html",
          "lua",
          "c",
          "cpp",
          "go",
          "markdown",
          "javascript",
          "typescript",
          "python",
          "vimdoc",
          "comment",
        },
        highlight = {
          enable = true,
        },
      })
    end,
  },
}
