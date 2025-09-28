local wk = require("which-key")

wk.add({
  {
    mode = { "n", "v" },

    -- Common
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  },
  {
    mode = { "i" },
    { "jk", "<escape>", desc = "Exit from insert mode"},
  },
  {
    mode = { "n" },
    group = "buffer",

    -- Nvim tree
    { "<leader>e", "<cmd>Neotree focus<cr>", desc = "Toggle file tree" },
    { "<leader>E", "<cmd>Neotree close<cr>", desc = "Close file tree" },

    -- Telescope - do not use TODO remove telescope
    -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
    -- { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope live grep" },
    -- { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Telescope buffers" },
    -- { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Telescope help tags" },

    -- Bufferline - do not use
    -- { "<C-Tab>",    "<cmd>BufferLineCycleNext<cr>",  desc = "Go to next buffer in bufferline" },
    -- { "<C-S-Tab>",  "<cmd>BufferLineCyclePrev<cr>",  desc = "Go to prev buffer in bufferline" },

    -- Buffer buy
    { "<leader>q", "<cmd>:lua Snacks.bufdelete()<cr>",           desc = "Delete current buffer" },

    -- Fuzzy finder
    { "<C-p>",     "<cmd>:FzfLua<cr>",                           desc = "Fzf" },
    { "<leader>g", "<cmd>:FzfLua live_grep<cr>",                 desc = "Fzf live grep" },
    { "<leader>r", "<cmd>:FzfLua live_grep_resume<cr>",          desc = "Fzf live grep resume" },
    { "<leader>f", "<cmd>:FzfLua files<cr>",                     desc = "Fzf files" },

    -- Snacks
    { "<leader>b", "<cmd>:lua Snacks.git.blame_line()<cr>",    desc = "Git blame line" },

    -- LSP
    { "gh",         "<cmd>lua vim.lsp.buf.hover()<cr>",           desc = "Displays hover information about the symbol under the cursor" },
    { "gd",         "<cmd>lua vim.lsp.buf.definition()<cr>",      desc = "Jump to the definition" },
    { "gD",         "<cmd>lua vim.lsp.buf.declaration()<cr>",     desc = "Jump to declaration" },
    { "gi",         "<cmd>lua vim.lsp.buf.implementation()<cr>",  desc = "Lists all the implementations for the symbol under the cursor" },
    { "go",         "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Jumps to the definition of the type symbol" },
    { "gr",         "<cmd>FzfLua lsp_workspace_diagnostics<cr>",  desc = "Lists all the references " },
    { "gs",         "<cmd>lua vim.lsp.buf.signature_help()<cr>",  desc = "Displays a function's signature information" },
    { "<F2>",       "<cmd>lua vim.lsp.buf.rename()<cr>",          desc = "Renames all references to the symbol under the cursor" },
    { "<F4>",       "<cmd>lua vim.lsp.buf.code_action()<cr>",     desc = "Selects a code action available at the current cursor position" },
    { "gl",         "<cmd>lua vim.diagnostic.open_float()<cr>",   desc = "Show diagnostics in a floating window" },
    --{ "[d",   "<cmd>lua vim.diagnostic.goto_prev()<cr>",    desc = "Move to the previous diagnostic" },
    --{ "]d",   "<cmd>lua vim.diagnostic.goto_next()<cr>",    desc = "Move to the next diagnostic" },
  },
  {
    mode = { "n", "t"},

    -- Snacks
    { "<C-o>", "<cmd>:lua Snacks.terminal.toggle()<cr>",    desc = "Toggle snacks terminal" },
    { "<C-l>",     "<cmd>:lua Snacks.lazygit()<cr>",             desc = "Lazygit" },
    -- ToggleTerm
    --{ "<C-o>", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal" },
  }
})

