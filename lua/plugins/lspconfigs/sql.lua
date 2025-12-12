local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.enable("sqlls")
vim.lsp.config("sqlls", {
  capabilities = lsp_capabilities,
})
