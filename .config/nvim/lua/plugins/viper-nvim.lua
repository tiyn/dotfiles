return {
  -- highlighting for the viper verification language
  "tiyn/viper.nvim",
  event = { "BufReadPre *.vpr", "FileType viper" },
  opts = {}
}
