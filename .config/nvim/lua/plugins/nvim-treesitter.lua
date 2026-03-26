return {
  -- better language highlighting by improved parsing
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    -- automatically close html-tags
    {
      "windwp/nvim-ts-autotag",
      opts = {
        opts = {
          enable_close = true,
          enable_rename = true,
        },
      },
    },
    -- 'p00f/nvim-ts-rainbow', -- color brackets
    "nvim-treesitter/nvim-treesitter-context",
  },
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
