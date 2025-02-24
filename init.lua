vim.cmd("language en_US")
local opt = vim.opt

opt.splitright = true
opt.splitbelow = true
opt.clipboard = 'unnamedplus'
opt.fixeol = false
opt.termguicolors = true
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.showmode = false


-- Lines
opt.number = true
--opt.relativenumber = true
opt.numberwidth = 4
opt.wrap = false
vim.o.signcolumn = 'number'

-- Empty chars
opt.list = true
opt.listchars = 'space: ,trail: ,tab:  ' -- ·

-- Tabs
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.expandtab = true

-- Configs

require("config.lazy")

require("keys.common")

vim.api.nvim_create_user_command("Make", function(details)
  vim.cmd("make", details.args)
end, {
  nargs = "*",
})
