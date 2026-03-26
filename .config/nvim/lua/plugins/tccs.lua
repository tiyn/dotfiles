return {
  -- colorscheme
  "tiyn/tccs.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    require("tccs").load(),
  },
}
