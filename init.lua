--vim.cmd("language en_US")
local opt = vim.opt

opt.splitright = true
opt.splitbelow = true
opt.clipboard = 'unnamedplus'
opt.fixeol = false
opt.termguicolors = true
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.showmode = false

-- Disable netrw directory listing because it blinks on startup
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Lines

opt.number = true
--opt.relativenumber = true
opt.numberwidth = 4
opt.wrap = false
vim.o.signcolumn = 'number'
-- does not work: vim.opt_local.formatoptions:remove({ 'r', 'o' })
vim.cmd([[autocmd BufEnter * set formatoptions-=ro]])

-- Empty chars
opt.list = true
opt.listchars = 'space: ,trail: ,tab:  ' -- ·

-- Tabs
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.expandtab = true

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    --source = 'always',
  },
})


-- Configs
--



require("config.lazy")

require("keys.common")

vim.api.nvim_create_user_command("Make", function(details)
  vim.cmd("make", details.args)
end, {
  nargs = "*",
})
