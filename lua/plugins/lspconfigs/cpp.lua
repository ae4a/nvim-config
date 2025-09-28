local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local project_root = vim.fn.getcwd()

vim.lsp.enable("clangd")
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--enable-config",
    "-query-driver=/usr/bin/g++",
    "--background-index",
    "--compile-commands-dir=" .. project_root .. "/build",
    "--function-arg-placeholders=0"
  },
  filetypes = { 'c', 'h', 'cpp', 'hpp' },
  capabilities = lsp_capabilities,
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", {}),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })
    end
  end,
})
