return {
  -- better language highlighting by improved parsing
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    -- automatically close html-tags
    "windwp/nvim-ts-autotag",
    -- color brackets
    -- 'p00f/nvim-ts-rainbow',
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
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,
        enable_rename = true,
      },
    })
  end,
}
