return {
  -- floating terminal to toggle
  "numtostr/fterm.nvim",
  keys = {
    {
      "<leader>tt",
      function()
        require("FTerm").toggle()
      end,
      mode = "n",
      desc = "Terminal: open",
    },
    {
      "<leader>gt",
      function()
        require("FTerm"):new({ cmd = "lazygit" }):toggle()
      end,
      mode = "n",
      desc = "Git: open lazygit",
    },
    {
      "<leader>tg",
      function()
        require("FTerm"):new({ cmd = "lazygit" }):toggle()
      end,
      mode = "n",
      desc = "Terminal: open lazygit",
    },
  },
  opts = {},
}
