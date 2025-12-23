return {
  -- better language highlighting by improved parsing
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      -- automatically close html-tags
      'windwp/nvim-ts-autotag',
      -- color brackets
      -- 'p00f/nvim-ts-rainbow',
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "css",
          "html",
          "markdown",
          "markdown_inline",
          "latex",
          "python",
          "rust",
          "lua",
        },
        -- highlight = { enable = true },
        autotag = { enable = false },
        -- rainbow = {
        --   enable = true,
        --   extended_mode = true,
        --   max_file_lines = nil,
        --   -- colors = {},
        --   -- termcolors = {}
        -- }
      })
    end
  }
}
