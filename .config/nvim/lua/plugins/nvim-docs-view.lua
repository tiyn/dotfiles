return {
  -- hover documentation
  "tiyn/nvim-docs-view",
  keys = {
    {
      "go",
      "<cmd>DocsViewToggle<CR>",
      mode = "n",
      desc = "LSP: toggle documentation window",
    },
  },
  opts = {
    position = "bottom",
  },
}
