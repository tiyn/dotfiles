return {
  -- fileexplorer on the side
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
    },
  },
  keys = {
    {
      "<F2>",
      "<cmd>NvimTreeToggle<CR>",
      desc = "File tree: toggle",
    },
  },
  opts = {
    sort_by = "case_sensitive",
    view = {
      width = 30,
    },
    filters = {
      dotfiles = true,
    },
    renderer = {
      group_empty = true,
      icons = {
        glyphs = {
          git = Git_signs,
        },
      },
    },
  },
}
