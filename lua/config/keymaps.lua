vim.keymap.set({ "i" }, "jk", "<escape>", { desc = "Exit from insert mode" })

-- HJKL
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-l>")

vim.keymap.set("n", "<leader>h", "<cmd>noh<cr>", { desc = "Clear highlights" })

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save File" })
vim.keymap.set("n", "<leader>uR", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

vim.keymap.set(
  "n",
  "gl",
  "<cmd>lua vim.diagnostic.open_float()<cr>",
  { desc = "Show diagnostics in a floating window" }
)

for _, lhs in ipairs({
  "<leader>ww",
  "<leader>wd",
  "<leader>wh",
  "<leader>wH",
  "<leader>wj",
  "<leader>wJ",
  "<leader>wk",
  "<leader>wK",
  "<leader>wl",
  "<leader>wL",
  "<leader>wm",
  "<leader>wo",
  "<leader>wq",
  "<leader>ws",
  "<leader>wT",
  "<leader>wv",
  "<leader>wx",
  "<leader>w+",
  "<leader>w-",
  "<leader>w<",
  "<leader>w=",
  "<leader>w>",
  "<leader>w_",
  "<leader>w|",
  "<leader>wD",
  "<leader>w<C-w>",
}) do
  pcall(vim.keymap.del, "n", lhs)
end

vim.keymap.set("n", "<C-w>d", "<C-w>c", { remap = true, desc = "Delete Window" })
vim.keymap.set("n", "<C-w>D", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
vim.keymap.set("n", "<C-w>m", "<cmd>wincmd |<cr><cmd>wincmd _<cr>", { desc = "Maximize Window" })

local ok, wk = pcall(require, "which-key")
if ok then
  wk.add({
    { "<C-w>", group = "windows" },
    { "<C-w>d", desc = "Delete Window" },
    { "<C-w>h", desc = "Go to the left window" },
    { "<C-w>H", desc = "Move window to far left" },
    { "<C-w>j", desc = "Go to the down window" },
    { "<C-w>J", desc = "Move window to far bottom" },
    { "<C-w>k", desc = "Go to the up window" },
    { "<C-w>K", desc = "Move window to far top" },
    { "<C-w>l", desc = "Go to the right window" },
    { "<C-w>L", desc = "Move window to far right" },
    { "<C-w>m", desc = "Maximize Window" },
    { "<C-w>o", desc = "Close all other windows" },
    { "<C-w>q", desc = "Quit a window" },
    { "<C-w>s", desc = "Split window" },
    { "<C-w>T", desc = "Break out into a new tab" },
    { "<C-w>v", desc = "Split window vertically" },
    { "<C-w>w", desc = "Switch windows" },
    { "<C-w>x", desc = "Swap current with next" },
    { "<C-w>+", desc = "Increase height" },
    { "<C-w>-", desc = "Decrease height" },
    { "<C-w><", desc = "Decrease width" },
    { "<C-w>=", desc = "Equally high and wide" },
    { "<C-w>>", desc = "Increase width" },
    { "<C-w>_", desc = "Max out the height" },
    { "<C-w>|", desc = "Max out the width" },
    { "<C-w>D", desc = "Show diagnostics under cursor" },
  })
end
