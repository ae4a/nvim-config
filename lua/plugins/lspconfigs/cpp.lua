local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").clangd.setup({
  cmd = {"clangd", "--enable-config", "--function-arg-placeholders=0"},
  filetypes = { 'c', 'h', 'cpp', 'hpp' },
  capabilities = lsp_capabilities,
})
