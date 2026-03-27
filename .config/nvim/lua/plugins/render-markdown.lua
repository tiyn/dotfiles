return {
  -- improved display for markdown files
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown" },
  cond = function()
    return vim.fn.expand("%:e") ~= "ipynb"
  end,
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = {
      lsp = {
        enabled = true,
      },
    },
  },
}
