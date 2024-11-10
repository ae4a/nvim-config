return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.install").compilers = { "clang" }
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "c", "cpp", "go", "markdown", "javascript", "typescript", "python" },
        highlight = {
          enable = true,
        },
      }
    end,
  }
}
