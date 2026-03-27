return {
  -- vs code like topbar
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  lazy = false,
  opts = {
    theme = {
      normal = { bg = "#272727" },
    },
  },
}
