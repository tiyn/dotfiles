return {
  -- folding improvements
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  keys = {
    {
      "K",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover({
            border = "rounded",
            focusable = false,
            max_width = 100,
          })
        end
      end,
      mode = "n",
      desc = "LSP: show documentation / peek folded section",
    },
  },
  config = function()
    require("ufo").setup()
    vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
      pattern = { "*" },
      callback = function()
        require("ufo").closeAllFolds()
      end,
    })
    vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
      pattern = { "*" },
      callback = function()
        require("ufo").openAllFolds()
      end,
    })
  end,
}
