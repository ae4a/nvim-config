local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.enable("cssls")
vim.lsp.config("cssls", {
  capabilities = lsp_capabilities,
})
