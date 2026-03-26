return {
  -- support for papis bibliography manager
  "jghauser/papis.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    enable_keymaps = false,
  },
}
