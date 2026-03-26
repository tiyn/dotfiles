return {
  -- improves splitting and joining blocks
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    {
      "<leader>m",
      function()
        require("treesj").toggle()
      end,
    },
  },
  config = function()
    require("treesj").setup()
  end,
}
