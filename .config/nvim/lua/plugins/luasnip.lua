return {
  -- snippet support
  "l3mon4d3/luasnip",
  version = "v2.*",
  dependencies = { "saadparwaiz1/cmp_luasnip" },
  lazy = true, -- load as dependency
  -- build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_snipmate").lazy_load()
  end,
}
