local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.enable("html")
vim.lsp.config("html", {
  capabilities = lsp_capabilities,
})
