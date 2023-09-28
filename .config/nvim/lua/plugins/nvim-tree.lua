return {
  -- fileexplorer on the side
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        lazy = true
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
            git = Git_signs
          },
        },
      }
    }
  }
}
