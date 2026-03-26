return {
  -- display inline diagnostics
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    preset = "classic",
    transparent_bg = true,
  },
  config = function(_, opts)
    require("tiny-inline-diagnostic").setup(opts)
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
}
