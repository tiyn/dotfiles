return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = {
      {
        "3rd/image.nvim",
        opts = {
          backend = "ueberzug",
          max_width = 100,
          max_height = 12,
          max_height_window_percentage = math.huge,
          max_width_window_percentage = math.huge,
          window_overlap_clear_enabled = true,
          window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
      },
      {
        "quarto-dev/quarto-nvim",
        dependencies = {
          "jmbuhr/otter.nvim",
          "nvim-treesitter/nvim-treesitter",
        },
        opts = {
          lspFeatures = {
            languages = { "python" },
            chunks = "all",
            diagnostics = {
              enabled = true,
              triggers = { "BufWritePost" },
            },
            completion = {
              enabled = true,
            },
          },
          codeRunner = {
            enabled = true,
            default_method = "molten",
          },
        },
      },
      {
        "GCBallesteros/jupytext.nvim",
        opts = {
          style = "markdown",
          output_extension = "md",
          force_ft = "markdown",
        },
      },
    },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
    end,
  },
}
