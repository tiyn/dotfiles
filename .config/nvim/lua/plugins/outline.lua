return {
  -- tree-like outline sidebar
  "hedyhli/outline.nvim",
  keys = {
    {
      "<F3>",
      "<cmd>Outline<CR>",
      desc = "CTags: toggle",
    },
  },
  opts = {
    outline_window = {
      width = 25,
    },
    symbols = {
      icon_source = "lspkind",
    },
  },
}
