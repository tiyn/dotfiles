return {
  -- colorscheme
  {
    'tiyn/tccs.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tccs').setup({
        require('tccs').load()
      })
    end
  }
}
