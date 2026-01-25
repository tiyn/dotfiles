return {
  "jghauser/papis.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    "MunifTanjim/nui.nvim",
    -- If not already installed, you may also want one of:
    "hrsh7th/nvim-cmp",
    -- {
    --   "saghen/blink.cmp",
    --   config = function()
    --     require("blink.cmp").setup({
    --       sources = {
    --         -- add 'papis' to the list of sources for the yaml filetype
    --         per_filetype = {
    --           yaml = { "papis" }
    --         },
    --     }
    --   })
    --   end,
    -- },
    -- Choose one of the following two if not already installed:
    "nvim-telescope/telescope.nvim",
    -- "folke/snacks.nvim",

  },
  config = function()
    require("papis").setup({
    -- Your configuration goes here
    enable_keymaps = true,
    })
  end,
}
