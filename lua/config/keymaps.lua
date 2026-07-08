vim.keymap.set({ "i" }, "jk", "<escape>", { desc = "Exit from insert mode" })
vim.keymap.set({ "n", "v" }, "<leader>w", "<cmd>w<cr>", { desc = "Write" })

-- HJKL
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-l>")

-- vim.keymap.set({ "n", "t" }, "<C-/>", function()
--   Snacks.terminal.toggle(nil, { 
--     cwd = LazyVim.root.get(),
--     win = { position = "float" },
--     -- backdrop = 60
--   })
-- end, { desc = "Toggle Floating Terminal (Root)" })
