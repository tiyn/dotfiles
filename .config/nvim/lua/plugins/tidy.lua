return {
  -- clean up white spaces and empty lines before writing
  "mcauley-penney/tidy.nvim",
  branch = "main",
  ft = { "markdown", "tex" },
  opts = {
    filetype_exclude = { "diff" },
  },
  config = function(_, opts)
    local tidy = require("tidy")
    tidy.setup(opts)
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
