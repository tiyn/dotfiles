return {
  -- side by side git diff mode coloring
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>gdo",
      "<cmd>DiffviewOpen<CR>",
      mode = "n",
      desc = "Git: open diff",
    },
    {
      "<leader>gdc",
      "<cmd>DiffviewClose<CR>",
      mode = "n",
      desc = "Git: close diff",
    },
  },
  opts = {},
}
