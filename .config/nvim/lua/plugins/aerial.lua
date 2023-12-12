return {
  -- ctags like menu
  {
    'stevearc/aerial.nvim',
    opts = {
      layout = {
        max_width = { 50, 0.2 },
        min_width = 25,
        resize_to_content = false,
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  }
}
