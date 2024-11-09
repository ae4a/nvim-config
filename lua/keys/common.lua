local wk = require("which-key")

wk.add({
  {
    mode = { "n", "v" },
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },

    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim tree" },
  }
})