return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },
    opts = {}
  },
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require("cmake-tools").setup({
        cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }
      })
    end,
  }
}
