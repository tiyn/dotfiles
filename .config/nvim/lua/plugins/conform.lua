return {
  -- improved refactoring
  "stevearc/conform.nvim",
  keys = {
    {
      "<F8>",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "LSP: format",
    },
  },
  opts = {
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
  },
}
