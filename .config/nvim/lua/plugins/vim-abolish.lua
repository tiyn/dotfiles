return {
  -- better substitutions
  "tpope/vim-abolish",
  keys = {
    {
      "<leader>sa",
      ":%s//g<Left><Left>",
      mode = "n",
      desc = "Substitute: free form",
    },
    {
      "<leader>ss",
      ":%s/\\<<C-r><C-w>\\>//g<Left><Left>",
      mode = "n",
      desc = "Substitute: word under cursor",
    },
  },
}
