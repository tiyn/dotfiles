return {
  "gnikdroy/projections.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  branch = "pre_release",
  config = function()
    require("projections").setup({
      workspaces = { -- Default workspaces to search for
        { "~/code/main", { ".git" } },
        { "~/code/uni", { ".git" } },
      },
      store_hooks = {
        pre = function()
          -- nvim-tree
          local nvim_tree_present, api = pcall(require, "nvim-tree.api")
          if nvim_tree_present then
            api.tree.close()
          end
        end,
      },
    })

    require("telescope").load_extension("projections")
  end,
}
