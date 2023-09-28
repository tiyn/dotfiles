return {
  -- improve spelling check for coding to feature camelcase, etc
  {
    'kamykn/spelunker.vim',
    dependencies = { 'kamykn/popup-menu.nvim' },
    config = function()
      vim.o.nospell = true
      vim.g.enable_spelunker_vim = 0
      vim.g.spelunker_disable_acronym_checking = 1
    end
  }
}
