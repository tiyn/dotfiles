-- nvim-treesitter/nvim-treesitter

local ts_config = require "nvim-treesitter.configs"

ts_config.setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "html",
    "java",
    "markdown",
    "latex",
    "python",
  },

  autotag = { enable = true },
}
