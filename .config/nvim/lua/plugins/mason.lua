return {
  -- lang server installations
  "williamboman/mason.nvim",
  dependencies = {
    "nvimtools/none-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  lazy = false,
  opts = { ui = { icons = Install_signs } },
}
