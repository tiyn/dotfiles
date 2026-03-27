return {
  -- git blame support
  "f-person/git-blame.nvim",
  lazy = true,
  config = function()
    vim.g.gitblame_display_virtual_text = 0
  end,
}
