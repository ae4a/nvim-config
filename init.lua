vim.cmd("language en_US")
vim.opt.termguicolors = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Configs

require("config.lazy")

require("keys.common")
