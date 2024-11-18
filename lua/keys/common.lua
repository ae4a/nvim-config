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
    mode = { "n" },

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
  },
  {
    mode = { "n", "t"},

    -- ToggleTerm
    { "<C-`>", "<cmd>ToggleTerm size=10 dir=./ direction=horizontal name=Terminal<cr>", desc = "Toggle terminal" },
  }
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()

    -- local opts = {buffer = true}
    wk.add({
      {
        mode = {"n"},
        group = "buffer",

        { "C-k", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Displays hover information about the symbol under the cursor" },
        { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Jump to the definition" },
        { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Jump to declaration" },
        { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Lists all the implementations for the symbol under the cursor" },
        { "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Jumps to the definition of the type symbol" },
        { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Lists all the references " },
        { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Displays a function's signature information" },
        { "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Renames all references to the symbol under the cursor" },
        { "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Selects a code action available at the current cursor position" },
        { "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostics in a floating window" },
        { "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Move to the previous diagnostic" },
        { "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Move to the next diagnostic" },
      }
    })
  end
})


