return {
  -- improved refactoring
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "isort", "black" },
          markdown = { "mdformat" },
          tex = { "latexindent" },
          lua = { "stylua" },
        },
      })
      require("conform").formatters.latexindent = {
        prepend_args = { "-y=defaultIndent: '  '" },
      }
    end,
  },
}
