return {
  -- translator
  "potamides/pantran.nvim",
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
