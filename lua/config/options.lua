vim.o.numberwidth = 4
vim.o.signcolumn = "number"
vim.o.relativenumber = false
-- vim.o.cursorline = false  -- Disables current line highlighting
vim.o.scrolloff = 10 -- Keeps 10 lines of context above/below the cursor
-- vim.o.breakindent = true
vim.g.trouble_lualine = false
vim.opt.statuscolumn = ""
vim.opt.signcolumn = "number"
vim.o.numberwidth = 4
vim.o.winborder = "rounded"

vim.g.lazyvim_inlay_hints = false

-- helm_ls reports the chart subdir (nearest Chart.yaml) as its root, which
-- otherwise hijacks LazyVim.root() / Neo-tree's root away from the git root.
vim.g.root_lsp_ignore = { "helm_ls" }

vim.o.list = true
vim.o.listchars = "space: ,trail: ,tab:  " -- ·
