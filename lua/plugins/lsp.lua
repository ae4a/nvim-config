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
    ensure_installed = { "lua_ls", "gopls", "ts_ls" },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      -- setup lsp servers
      require("plugins.lspconfigs.lua")
      require("plugins.lspconfigs.golang")
      require("plugins.lspconfigs.ts")
      require("plugins.lspconfigs.cpp")
      --require("plugins.lspconfigs.html")
      require("plugins.lspconfigs.css")
      --require("plugins.lspconfigs.sql")
      require("plugins.lspconfigs.psql")
    end,
  },
  require("plugins.lang.go"),
  require("plugins.lang.lua"),
  require("plugins.lang.ts"),
}
