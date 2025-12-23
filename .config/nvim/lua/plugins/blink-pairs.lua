return {
  "saghen/blink.pairs",
  version = "*", -- (recommended) only required with prebuilt binaries

  -- download prebuilt binaries from github releases
  dependencies = "saghen/blink.download",

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
      ns = vim.api.nvim_create_namespace("blink.pairs"),
    },
    debug = false,
  },
}
