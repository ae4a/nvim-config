require("autocmds.winbar")

-- Remove autocomment
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "Normal" })
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*/templates/*.yaml", "*/templates/*.yml", "deployment.yaml", "values.yaml", "Chart.yaml" },
  callback = function()
    vim.opt_local.filetype = "helm"
  end,
})
