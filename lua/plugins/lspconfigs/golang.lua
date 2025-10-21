local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.enable("gopls")
vim.lsp.config("gopls", {
  filetypes = { "go", "go.mod" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    }
  },
  capabilities = lsp_capabilities,
})
