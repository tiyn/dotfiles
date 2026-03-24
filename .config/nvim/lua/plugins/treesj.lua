return {
  -- improves splitting and joining blocks
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup()
  end,
}
