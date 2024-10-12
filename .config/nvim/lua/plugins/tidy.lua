return {
  -- clean up white spaces and empty lines before writing
  {
    "mcauley-penney/tidy.nvim",
    branch = "main",
    opts = {
      filetype_exclude = { "diff" }
    }
  }
}
