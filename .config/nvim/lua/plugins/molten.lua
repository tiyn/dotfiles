return {
  -- jupyter notebook support
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
      keys = {
        {
          "<leader>rc",
          function()
            require("quarto.runner").run_cell()
          end,
          desc = "Quarto: Run cell",
        },
        {
          "<leader>ra",
          function()
            require("quarto.runner").run_above()
          end,
          desc = "Quarto: Run cell and above",
        },
        {
          "<leader>rA",
          function()
            require("quarto.runner").run_all()
          end,
          desc = "Quarto: Run all cells",
        },
        {
          "<leader>rl",
          function()
            require("quarto.runner").run_line()
          end,
          desc = "Quarto: Run line",
        },
        {
          "<leader>rr",
          function()
            require("quarto.runner").run_range()
          end,
          desc = "Quarto: Run visual range",
        },
        {
          "<leader>rL",
          function()
            require("quarto.runner").run_all(true)
          end,
          desc = "Quarto: Run all cells of all languages",
        },
      },
      config = function()
        require("quarto").setup({
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
        })
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "markdown",
          callback = function()
            require("quarto").activate()
          end,
        })
      end,
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
}
