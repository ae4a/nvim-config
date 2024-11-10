local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").denols.setup({
  capabilities = lsp_capabilities,
})
