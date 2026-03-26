return {
  -- improved movement for code
  "aaronik/treewalker.nvim",
  keys = {
    {
      "<leader><C-k>",
      "<cmd>Treewalker Up<CR>",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<leader><C-j>",
      "<cmd>Treewalker Down<CR>",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<leader><C-h>",
      "<cmd>Treewalker Left<CR>",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<leader><C-l>",
      "<cmd>Treewalker Right<CR>",
      mode = { "n", "v" },
      silent = true,
    },
    {
      "<leader><C-S-k>",
      "<cmd>Treewalker SwapUp<CR>",
      mode = "n",
      silent = true,
    },
    {
      "<leader><C-S-j>",
      "<cmd>Treewalker SwapDown<CR>",
      mode = "n",
      silent = true,
    },
    {
      "<leader><C-S-h>",
      "<cmd>Treewalker SwapLeft<CR>",
      mode = "n",
      silent = true,
    },
    {
      "<leader><C-S-l>",
      "<cmd>Treewalker SwapRight<CR>",
      mode = "n",
      silent = true,
    },
  },
}
