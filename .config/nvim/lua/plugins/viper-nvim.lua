return {
  -- highlighting for the viper verification language
  "tiyn/viper.nvim",
  event = { "BufReadPre", "BufNewFile" },
  pattern = "*.vpr",
  opts = {},
}
