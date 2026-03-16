return {
  -- better language highlighting by improved parsing
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    -- automatically close html-tags
    "windwp/nvim-ts-autotag",
    -- color brackets
    -- 'p00f/nvim-ts-rainbow',
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
        -- "latex", -- TODO: currently prone to errors
        "python",
        "rust",
        "lua",
        "yaml",
    })
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,
        enable_rename = true,
      }
    })
    -- WARN: not directly compatible anymore
    -- highlight = { enable = true },
    -- rainbow = {
    --   enable = true,
    --   extended_mode = true,
    --   max_file_lines = nil,
    --   -- colors = {},
    --   -- termcolors = {}
  end,
}
