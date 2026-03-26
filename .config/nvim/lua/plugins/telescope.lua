return {
  -- fuzzy finder
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "archie-judd/telescope-words.nvim",
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<CR>",
      desc = "Telescope: find files",
    },
    {
      "<leader>wd",
      function()
        require("telescope").extensions.telescope_words.search_dictionary()
      end,
      desc = "Telescope: search dictionary",
    },
    {
      "<leader>wt",
      function()
        require("telescope").extensions.telescope_words.search_thesaurus()
      end,
      desc = "Telescope: search thesaurus",
    },
  },
  opts = {},
}
