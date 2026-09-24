return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        signs = false, -- Disables diagnostic signs in the gutter globally via LSP
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                errcheck = false, -- This turns off the "error return value is not checked" warning
              },
            },
          },
        },
      },
    },
  },
}
