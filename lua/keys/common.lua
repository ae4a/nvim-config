local wk = require("which-key")
local cur_snacks_win = nil
local cur_snacks_win_name = ""

wk.add({
  {
    mode = { "n", "v" },

    -- Common
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  },
  {
    mode = { "i" },
    { "jk", "<escape>", desc = "Exit from insert mode" },
  },
  {
    mode = { "n" },
    group = "buffer",

    -- Nvim tree
    { "<leader>e", "<cmd>Neotree focus<cr>",                             desc = "Toggle file tree" },
    { "<leader>E", "<cmd>Neotree close<cr>",                             desc = "Close file tree" },

    -- Telescope - do not use TODO remove telescope
    -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
    -- { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope live grep" },
    -- { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Telescope buffers" },
    -- { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Telescope help tags" },

    -- Bufferline - do not use
    -- { "<C-Tab>",    "<cmd>BufferLineCycleNext<cr>",  desc = "Go to next buffer in bufferline" },
    -- { "<C-S-Tab>",  "<cmd>BufferLineCyclePrev<cr>",  desc = "Go to prev buffer in bufferline" },

    -- Buffer buy
    { "<leader>q", "<cmd>:lua Snacks.bufdelete()<cr>",                   desc = "Delete current buffer" },

    -- Fuzzy finder
    { "<C-p>",     "<cmd>:FzfLua<cr>",                                   desc = "Fzf" },
    { "<leader>g", "<cmd>:FzfLua live_grep<cr>",                         desc = "Fzf live grep" },
    { "<leader>r", "<cmd>:FzfLua live_grep_resume<cr>",                  desc = "Fzf live grep resume" },
    { "<leader>f", "<cmd>:FzfLua files<cr>",                             desc = "Fzf files" },
    { "<leader>k", "<cmd>:FzfLua buffers<cr>",                           desc = "Fzf buffers" },

    -- Snacks
    { "<leader>b", "<cmd>:lua Snacks.picker.git_log_line()<cr>",         desc = "Git logs for a line" },
    { "gs",        "<cmd>lua Snacks.picker.lsp_symbols()<cr>",           desc = "Shows file LSP symbols" },
    { "gS",        "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>", desc = "Shows workspace LSP symbols" },

    -- LSP
    { "gh",        "<cmd>lua vim.lsp.buf.hover()<cr>",                   desc = "Displays hover information about the symbol under the cursor" },
    { "gd",        "<cmd>lua vim.lsp.buf.definition()<cr>",              desc = "Jump to the definition" },
    { "gD",        "<cmd>lua vim.lsp.buf.declaration()<cr>",             desc = "Jump to declaration" },
    { "gi",        "<cmd>lua vim.lsp.buf.implementation()<cr>",          desc = "Lists all the implementations for the symbol under the cursor" },
    { "go",        "<cmd>lua vim.lsp.buf.type_definition()<cr>",         desc = "Jumps to the definition of the type symbol" },
    { "gr",        "<cmd>FzfLua lsp_workspace_diagnostics<cr>",          desc = "Lists all the references " },
    { "<F2>",      "<cmd>lua vim.lsp.buf.rename()<cr>",                  desc = "Renames all references to the symbol under the cursor" },
    { "<F4>",      "<cmd>lua vim.lsp.buf.code_action()<cr>",             desc = "Selects a code action available at the current cursor position" },
    { "gl",        "<cmd>lua vim.diagnostic.open_float()<cr>",           desc = "Show diagnostics in a floating window" },
    --{ "[d",   "<cmd>lua vim.diagnostic.goto_prev()<cr>",    desc = "Move to the previous diagnostic" },
    --{ "]d",   "<cmd>lua vim.diagnostic.goto_next()<cr>",    desc = "Move to the next diagnostic" },
  },
  {
    mode = { "n", "t" },

    -- Snacks
    {
      "<C-o>",
      function()
        if cur_snacks_win ~= nil and cur_snacks_win_name ~= "terminal" and cur_snacks_win.closed ~= true then
          cur_snacks_win:hide()
        end
        local win, created = Snacks.terminal.toggle()
        cur_snacks_win = win
        cur_snacks_win_name = "terminal"
      end,
      desc = "Toggle snacks terminal"
    },
    {
      "<C-l>",
      function()
        if cur_snacks_win ~= nil and cur_snacks_win.closed ~= true then
          cur_snacks_win:hide()
          if cur_snacks_win_name == "lazygit" then
            return
          end
        end
        cur_snacks_win = Snacks.lazygit()
        cur_snacks_win_name = "lazygit"
      end,
      desc = "Toggle lazygit"
    },
  }
})
