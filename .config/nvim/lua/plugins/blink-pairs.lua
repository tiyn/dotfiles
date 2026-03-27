return {
  -- rainbow and auto-pairs for parenthesis
  "saghen/blink.pairs",
  version = "*", -- (recommended) only required with prebuilt binaries
  dependencies = { "saghen/blink.download" }, -- download prebuilt binaries from github releases
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
      ns = vim.api.nvim_create_namespace("blink.pairs"),
    },
    debug = false,
  },
}
