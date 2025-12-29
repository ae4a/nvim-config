return {
  {
    'nvim-mini/mini.pairs',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end,
  },
  {
    'nvim-mini/mini.ai',
    version = '*',
    config = function()
      require('mini.ai').setup()
    end,
  },
  {
    'nvim-mini/mini.move',
    version = '*',
    config = function()
      require('mini.move').setup()
    end,
  },
  {
    'nvim-mini/mini.comment',
    version = '*',
    config = function()
      require('mini.comment').setup()
    end,
  },
}
