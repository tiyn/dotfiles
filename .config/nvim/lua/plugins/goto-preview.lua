return {
  -- preview definitions using floating windows
  "rmagatti/goto-preview",
  dependencies = "rmagatti/logger.nvim",
  keys = {
    {
      "gpd",
      function()
        require("goto-preview").goto_preview_definition()
      end,
      desc = "LSP: preview definition",
    },
    {
      "gpy",
      function()
        require("goto-preview").goto_preview_type_definition()
      end,
      desc = "LSP: preview type definition",
    },
    {
      "gpi",
      function()
        require("goto-preview").goto_preview_implementation()
      end,
      desc = "LSP: list preview implementation",
    },
    {
      "gpD",
      function()
        require("goto-preview").goto_preview_declaration()
      end,
      desc = "LSP: preview declaration",
    },
    {
      "gpr",
      function()
        require("goto-preview").goto_preview_references()
      end,
      desc = "LSP: list preview references",
    },
    {
      "gpc",
      function()
        require("goto-preview").close_all_win()
      end,
      desc = "LSP: close all preview windows",
    },
  },
  opts = {
    border = "rounded",
    preview_window_title = { enable = true, position = "center" },

    post_open_hook = function(bufnr, _)
      local close = function()
        require("goto-preview").close_all_win()
      end

      vim.keymap.set("n", "<c-h>", close, { buffer = bufnr, silent = true })
      vim.keymap.set("n", "q", close, { buffer = bufnr, silent = true })
    end,
  },
}
