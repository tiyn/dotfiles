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
          sh = { "shfmt" },
          bash = { "shfmt" },
          zsh = { "shfmt" },
          tex = { "latexindent" },
          yaml = { "yamlfmt" },
        },
      })
    end,
  },
}
