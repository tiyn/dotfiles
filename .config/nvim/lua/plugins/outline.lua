return {
  "hedyhli/outline.nvim",
  keys = {
    {
      "<F3>",
      "<cmd>Outline<CR>",
      desc = "CTags: toggle",
    },
  },
  config = function()
    require("outline").setup({
      outline_window = {
        width = 25,
      },
      symbols = {
        icon_source = "lspkind",
      },
    })
  end,
}
