return {
  -- highlighting for the viper verification language
  "tiyn/viper.nvim",
  event = { "BufReadPre *.vpr", "FileType viper" },
  config = function()
    require("viper").setup()
  end,
}
