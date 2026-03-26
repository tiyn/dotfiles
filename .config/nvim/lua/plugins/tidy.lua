return {
  -- clean up white spaces and empty lines before writing
  "mcauley-penney/tidy.nvim",
  branch = "main",
  ft = { "markdown", "tex" },
  config = function()
    local tidy = require("tidy")
    tidy.setup({
      filetype_exclude = { "diff" },
    })
    tidy.opts.enabled_on_save = false
    vim.api.nvim_create_autocmd("BufLeave", {
      pattern = { "*.md", "*.tex" },
      callback = function()
        if vim.bo.modifiable then
          tidy.run()
        end
      end,
    })
  end,
}
