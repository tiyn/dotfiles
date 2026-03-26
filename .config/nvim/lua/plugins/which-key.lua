return {
  -- improved keybindings, previewing them
  "folke/which-key.nvim",
  config = function()
    require("which-key").add({
      { mode = "n", "g", desc = "LSP: goto" },
      { mode = "n", "gp", desc = "LSP: preview" },
      { mode = "c", "w", desc = "Write" },
      { mode = "c", "w!", desc = "Write: overwrite" },
      { mode = "n", "<leader>a", desc = "AI" },
      { mode = "n", "<leader>g", desc = "Git" },
      { mode = "n", "<leader>f", desc = "Telescope: find" },
      { mode = "n", "<leader>gd", desc = "Git: diff" },
      { mode = "n", "<leader>s", desc = "Substitute" },
      { mode = "n", "<leader>t", desc = "Terminal" },
      { mode = "n", "<leader>r", desc = "Quarto" },
      { mode = "n", "<C-W>", desc = "Navigation" },
      { mode = "n", "<leader>p", desc = "Lilypond" },
    })
  end,
}
