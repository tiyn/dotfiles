return {
  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'archie-judd/telescope-words.nvim'
    },
    opts = {}
  }
}
