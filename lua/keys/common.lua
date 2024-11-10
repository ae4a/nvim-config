local wk = require("which-key")

wk.add({
  {
    mode = { "n", "v" },

    -- Common
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  },
  {
    mode = { "i" },
    { "jk", "<escape>", desc = "Exit from insert mode"},
  },
  {
    mode = {"n"},

    -- Nvim tree
    { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Toggle nvim tree" },

    -- Telescope
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },

    -- Bufferline
    { "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Go to next buffer in bufferline" },
    { "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Go to prev buffer in bufferline" },

    -- Buffer buy
    { "<leader>q", "<cmd>:Bdelete<cr>", desc = "Delete current buffer" },
    
  }
})
