return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    ensure_installed = { "lua_ls" },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp"},
    "neovim/nvim-lspconfig",
    config = function()
      -- setup lsp servers
      require("plugins.lspconfigs.lua")
    end,
  },
}