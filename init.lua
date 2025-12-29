local opt = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

vim.o.number = true
vim.o.numberwidth = 4

vim.o.mouse = 'a'
vim.o.showmode = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.wrap = false
vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'number'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.o.listchars = 'space: ,trail: ,tab:  ' -- ·

vim.o.inccommand = 'split'

vim.o.fixeol = false
vim.o.termguicolors = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.o.showmode = false

vim.o.cursorline = false -- TODO tempting... but does not play well with gitsigns

vim.o.scrolloff = 10

vim.o.confirm = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- TEST if I like it

-- Disable netrw directory listing because it blinks on startup
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.cmd([[autocmd BufEnter * set formatoptions-=ro]]) -- Removes autocomment

-- Tabs
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.expandtab = true

-- Diagnostics
-- vim.diagnostic.config({
--   virtual_text = false,
--   severity_sort = true,
--   float = {
--     border = 'rounded',
--     --source = 'always',
--   },
-- })


-- Configs

require("config.lazy")
require("config.keys")
require("config.winbar")
