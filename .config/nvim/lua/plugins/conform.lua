return {
  -- improved refactoring
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          markdown = { "mdformat" },
          python = { "isort", "yapf" },
          sh = { "beautysh" },
          shell = { "beautysh" },
          tex = { "latexindent" },
          yaml = { "yamlfmt" },
        },
      })
      require("conform").formatters.latexindent = {
        args = require("conform.util").extend_args(
          require("conform.formatters.latexindent").args,
          { "-y=defaultIndent: '  '" }
        ),
      }
      require("conform").formatters.beautysh = {
        args = require("conform.util").extend_args(
          require("conform.formatters.beautysh").args,
          { "--indent-size=2", "--force-function-style=fnpar" }
        ),
      }
    end,
  },
}
