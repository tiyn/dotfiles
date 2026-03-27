return {
  -- quarto support
  "quarto-dev/quarto-nvim",
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = true, -- load as dependency
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
  config = function(_, opts)
    local quarto = require("quarto")
    quarto.setup(opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        quarto.activate()
      end,
    })
  end,
}
