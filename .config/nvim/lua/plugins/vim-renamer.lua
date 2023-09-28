return {
  -- rename files in buffer
  {
    'qpkorr/vim-renamer',
    priority = 100,
    config = function()
      require('renamer')
    end
  }
}
