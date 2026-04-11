return {
  -- navigate between projects using telescope
  "gnikdroy/projections.nvim",
  branch = "pre_release",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
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
    local projections = require("projections")
    local session = require("projections.session")

    projections.setup(opts)
    require("telescope").load_extension("projections")

    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        session.store(vim.loop.cwd())
      end,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() ~= 0 then
          return
        end
        vim.schedule(function()
          local session_info = session.info(vim.loop.cwd())
          if session_info ~= nil then
            session.restore(vim.loop.cwd())
          end
        end)
      end,
      desc = "Restore last session automatically",
    })
  end,
}
