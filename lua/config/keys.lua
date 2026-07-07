local float_manager = require("config.float_manager")
local wk = require("which-key")

-- Floating window toggles via the unified float manager
local lazygit_win = nil

local function toggle_terminal()
  float_manager.toggle(
    "terminal",
    function() Snacks.terminal.toggle() end,
    function() Snacks.terminal.toggle() end,
    function()
      local w = Snacks.terminal.get()
      return w ~= nil and w.closed ~= true
    end
  )
end

local function toggle_lazygit()
  float_manager.toggle(
    "lazygit",
    function() lazygit_win = Snacks.lazygit() end,
    function() if lazygit_win then lazygit_win:hide() end end,
    function() return lazygit_win ~= nil and lazygit_win.closed ~= true end
  )
end

-- All fzf-lua pickers share a single hidden process slot, so they all use the
-- same "fzf" name in the float manager.  The close_fn calls fzf-lua's own hide
-- API; the open_fn opens whichever picker was requested.
local function fzf(picker, opts)
  float_manager.toggle(
    "fzf",
    function() require("fzf-lua")[picker](opts) end,
    function() require("fzf-lua").hide() end,
    function()
      -- fzf-lua sets filetype="fzf" on its terminal buffer; if no such buffer
      -- has an open window the picker was closed externally.
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == "fzf" and #vim.fn.win_findbuf(buf) > 0 then
          return true
        end
      end
      return false
    end
  )
end

-- All Snacks pickers share the "snacks_picker" name. Snacks has no hide API,
-- so close_fn closes all active pickers via Snacks.picker.get().
local function snacks_pick(picker, opts)
  float_manager.toggle(
    "snacks_picker",
    function() Snacks.picker[picker](opts) end,
    function()
      for _, p in ipairs(Snacks.picker.get()) do p:close() end
    end,
    function() return #Snacks.picker.get() > 0 end
  )
end

-- Some unbinding
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grt")

wk.add({
  {
    mode = { "i" },
    { "jk", "<escape>", desc = "Exit from insert mode" },
  },
  {
    mode = { "n", "v" },

    -- Common
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  },
  {
    mode = { "n" },
    group = "buffer",

    -- Nvim tree
    { "<leader>e", "<cmd>Neotree focus<cr>", desc = "Focus file tree" },
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
    { "<leader>q", "<cmd>:lua Snacks.bufdelete()<cr>", desc = "Delete current buffer" },

    -- Fuzzy finder
    { "<C-p>", function() fzf("builtin") end, desc = "Fzf" },
    { "<leader>g", function() fzf("live_grep") end, desc = "Fzf live grep" },
    { "<leader>r", function() fzf("live_grep_resume") end, desc = "Fzf live grep resume" },
    { "<leader>f", function() fzf("files") end, desc = "Fzf files" },
    { "<leader>k", function() fzf("buffers") end, desc = "Fzf buffers" },

    -- Snacks
    { "<leader>b", function() snacks_pick("git_log_line") end, desc = "Git logs for a line" },
    { "<leader>s", function() snacks_pick("lsp_symbols") end, desc = "Shows file LSP symbols" },
    { "<leader>p", function() snacks_pick("lsp_workspace_symbols") end, desc = "Shows workspace LSP symbols" },

    -- LSP
    { "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Displays hover information about the symbol under the cursor" },
    { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Jump to the definition" },
    { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Jump to declaration" },
    { "gi", function() fzf("lsp_implementations") end, desc = "Lists all the implementations for the symbol under the cursor" },
    { "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Jumps to the definition of the type symbol" },
    { "gr", function() fzf("lsp_references") end, desc = "Lists all the references " },
    { "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Renames all references to the symbol under the cursor" },
    { "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Selects a code action available at the current cursor position" },
    { "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostics in a floating window" },
    --{ "[d",   "<cmd>lua vim.diagnostic.goto_prev()<cr>",    desc = "Move to the previous diagnostic" },
    --{ "]d",   "<cmd>lua vim.diagnostic.goto_next()<cr>",    desc = "Move to the next diagnostic" },
    {
      "<leader>ih",
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
      desc = "Toggle inlay hints",
    },
    -- Xcodebuild
    { "<leader>x", "<cmd>:XcodebuildPicker<cr>", desc = "Xcodebuild picker" },

    -- Opencode
    {
      mode = { "n", "x" },
      { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, desc = "Ask opencode…" },
      { "<leader>os", function() require("opencode").select() end, desc = "Execute opencode action…" },
      ---@diagnostic disable-next-line: redundant-return-value
      { "<leader>oo", function() return require("opencode").operator("@this ") end, desc = "Add range to opencode", expr = true },
    },
    {
      mode = { "n" },
      { "<leader>ot", function() require("opencode").toggle() end, desc = "Toggle opencode" },
      {
        "<leader>of",
        function()
          if vim.bo.filetype == "opencode_terminal" then
            vim.cmd("wincmd p")
          else
            local provider = require("opencode.config").provider
            local win = provider and provider.get and provider:get()
            if win and win.closed == false then
              win:focus()
            else
              require("opencode").toggle()
            end
          end
        end,
        desc = "Focus opencode",
      },
      ---@diagnostic disable-next-line: redundant-return-value
      { "<leader>ol", function() return require("opencode").operator("@this ") .. "_" end, desc = "Add line to opencode", expr = true },
      { "<leader>ou", function() require("opencode").command("session.half.page.up") end, desc = "Scroll opencode up" },
      { "<leader>od", function() require("opencode").command("session.half.page.down") end, desc = "Scroll opencode down" },
    },
  },
  {
    mode = { "n", "t" },

    -- Snacks
    {
      "<C-h>",
      toggle_terminal,
      desc = "Toggle terminal",
    },
    {
      "<C-l>",
      toggle_lazygit,
      desc = "Toggle lazygit",
    },
  },
})
