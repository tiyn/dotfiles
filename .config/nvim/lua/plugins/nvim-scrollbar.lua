return {
  -- scrollbar with git and diagnostics support for easier navigation
  "petertriho/nvim-scrollbar",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
    "lewis6991/gitsigns.nvim",
  },
  opts = {
    marks = {
      Cursor = { highlight = "Normal" },
      Search = { highlight = "Special" },
      Error = { highlight = "DiagnosticSignError" },
      Warn = { highlight = "DiagnosticSignWarn" },
      Info = { highlight = "DiagnosticSignInfo" },
      Hint = { highlight = "DiagnosticSignHint" },
      Misc = { highlight = "Special" },
      GitAdd = { highlight = "GitGutterAdd" },
      GitChange = { highlight = "GitGutterChange" },
      GitDelete = { highlight = "GitGutterDelete" },
    },
    excluded_filetypes = {
      "cmp_docs",
      "cmp_menu",
      "noice",
      "prompt",
      "TelescopePrompt",
      "NvimTree",
      "Navbuddy",
      "FTerm",
      "",
    },
  },
  config = function(_, opts)
    local scrollbar = require("scrollbar")
    scrollbar.setup(opts)
    require("scrollbar.handlers.search").setup()
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
