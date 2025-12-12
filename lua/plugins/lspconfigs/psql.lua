local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.enable("postgres_lsp")
vim.lsp.config("postgres_lsp", {
  capabilities = lsp_capabilities,
})
