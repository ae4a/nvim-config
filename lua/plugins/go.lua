return {
  {
    "neovim/nvim-lspconfig",
    opts = {
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
