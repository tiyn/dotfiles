return {
  -- improved refactoring
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "isort", "yapf" },
          markdown = { "mdformat" },
          tex = { "latexindent" },
          lua = { "stylua" },
          yaml = { "yamlfmt" },
        },
      })
      require("conform").formatters.latexindent = {
        args = require("conform.util").extend_args(
          require("conform.formatters.latexindent").args,
          { "-y=defaultIndent: '  '" }
        ),
      }
    end,
  },
}
