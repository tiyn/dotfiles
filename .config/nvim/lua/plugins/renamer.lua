return {
  -- improved gui for renaming
  "filipdutescu/renamer.nvim",
  branch = "master",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<F5>",
      function()
        require("renamer").rename()
      end,
      desc = "LSP: rename",
    },
  },
  opts = {},
}
