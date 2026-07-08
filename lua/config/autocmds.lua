require("autocmds.winbar")

-- Remove autocomment
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "r", "o" })
  end,
})
