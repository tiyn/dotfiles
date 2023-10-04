return {
  -- improved refactoring
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
        markdown = { "mdformat" },
      },
    }
  }
}
