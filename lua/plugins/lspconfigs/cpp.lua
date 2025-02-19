local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").clangd.setup({
  filetypes = { 'c', 'h', 'cpp', 'hpp' },
  capabilities = lsp_capabilities,
})
