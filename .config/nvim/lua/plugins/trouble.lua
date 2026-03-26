return {
  -- list of errors
  "folke/trouble.nvim",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
    },
  },
  keys = {
    {
      "<F4>",
      "<cmd>Trouble diagnostics toggle<CR>",
      mode = "n",
      desc = "LSP: toggle error list",
    },
  },
  opts = {},
}
