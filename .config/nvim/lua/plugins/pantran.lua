return {
  -- translator
  "potamides/pantran.nvim",
  keys = {
    {
      "<leader>tr",
      "<cmd>Pantran<CR>",
      mode = { "n", "v" },
      desc = "Pantran: translate",
    },
  },
  opts = {
    default_engine = "google",
    -- default_engine = "deepl",
    engines = {
      deepl = {
        default_target = "de",
      },
      google = {
        fallback = {
          default_target = "de",
        },
      },
    },
  },
}
