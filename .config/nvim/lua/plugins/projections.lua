return {
  -- navigate between projects using telescope
  "gnikdroy/projections.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  branch = "pre_release",
  keys = {
    {
      "<leader>fp",
      function()
        vim.cmd("Telescope projections")
      end,
      desc = "Telescope: find projects",
    },
  },
  opts = {
    workspaces = {
      { "~/code/main", { ".git" } },
      { "~/code/uni", { ".git" } },
    },
    store_hooks = {
      pre = function()
        local ok, api = pcall(require, "nvim-tree.api")
        if ok then
          api.tree.close()
        end
      end,
    },
  },
  config = function(_, opts)
    require("projections").setup(opts)
    require("telescope").load_extension("projections")
  end,
}
