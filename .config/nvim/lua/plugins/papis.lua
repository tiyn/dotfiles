return {
  -- support for papis bibliography manager
  "jghauser/papis.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("papis").setup({
      -- Your configuration goes here
      enable_keymaps = false,
    })
  end,
}
