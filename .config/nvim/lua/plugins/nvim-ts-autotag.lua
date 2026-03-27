return {
  -- automatically close tags with treesitter
  "windwp/nvim-ts-autotag",
  lazy = true, -- load as dependency
  opts = {
    opts = {
      enable_close = true,
      enable_rename = true,
    },
  },
}
