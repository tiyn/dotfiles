return {
  -- better language highlighting by improved parsing
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag", -- automatically close html-tags
    "nvim-treesitter/nvim-treesitter-context",
  },
  lazy = false,
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup()
    treesitter.install({
      "bash",
      "css",
      "html",
      "markdown",
      "markdown_inline",
      "latex",
      "python",
      "rust",
      "lua",
      "yaml",
    })
  end,
}
