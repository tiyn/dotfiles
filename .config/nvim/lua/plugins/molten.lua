return {
  -- jupyter notebook support
  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  version = "^1.0.0",
  dependencies = {
    "3rd/image.nvim",
    "quarto-dev/quarto-nvim",
    "GCBallesteros/jupytext.nvim",
  },
  lazy = false,
  init = function()
    vim.g.molten_auto_open_output = false
    vim.g.molten_wrap_output = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 20
  end,
}
