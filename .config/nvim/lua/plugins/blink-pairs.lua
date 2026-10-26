return {
  -- rainbow and auto-pairs for parenthesis
  "saghen/blink.pairs",
  version = "*", -- (recommended) only required with prebuilt binaries
  dependencies = { "saghen/blink.download" }, -- download prebuilt binaries from github releases
  build = function()
    require("blink.pairs").download():pwait(60000)
  end,
  lazy = false,
  --- @module 'blink.pairs'
  --- @type blink.pairs.Config
  opts = {
    mappings = {
      enabled = true,
      pairs = {
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ["'"] = "'",
        ['"'] = '"',
        ["`"] = "`",
      },
    },
    highlights = {
      enabled = true,
      groups = {
        "BlinkPairsOrange",
        "BlinkPairsPurple",
        "BlinkPairsBlue",
      },
      priority = 200,
    },
    debug = false,
  },
}
