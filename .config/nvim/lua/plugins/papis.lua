return {
  -- support for papis bibliography manager
  "jghauser/papis.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  lazy = false,
  opts = {
    enable_keymaps = false,
    init_filetypes = { "yaml", "tex" }
  },
  config = function(_, opts)
    require("papis").setup(opts)
  end,
}
