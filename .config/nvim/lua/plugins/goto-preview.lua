return {
  -- preview definitions using floating windows
  "rmagatti/goto-preview",
  dependencies = "rmagatti/logger.nvim",
  config = function()
    require("goto-preview").setup({
      border = "rounded",
      preview_window_title = { enable = true, position = "center" },

      post_open_hook = function(bufnr, winid)
        local close = function()
          require("goto-preview").close_all_win()
        end

      vim.keymap.set("n", "<c-h>", close, { buffer = bufnr, silent = true })
      vim.keymap.set("n", "q", close, { buffer = bufnr, silent = true })
      end,
    })
  end,
}
