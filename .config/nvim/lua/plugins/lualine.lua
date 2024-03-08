return {
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
      },
      {
        "f-person/git-blame.nvim",
        config = function()
          vim.g.gitblame_display_virtual_text = 0
        end,
      },
      { "tiyn/tccs.nvim" },
      {
        "roobert/action-hints.nvim",
        config = function()
          require("action-hints").setup({
            template = {
              definition = { text = "D", color = "#add8e6" },
              references = { text = "R%s", color = "#ff6666" },
            },
          })
        end,
      },
    },
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true,
          symbols = {
            error = Error_sign,
            warn = Warn_sign,
            hint = Hint_sign,
            info = Info_sign,
          },
          theme = "tccs",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_b = {
            {
              require("gitblame").get_current_blame_text,
              cond = require("gitblame").is_blame_text_available,
            },
          },
          lualine_c = {},
          lualine_x = {
            require("action-hints").statusline,
            "encoding",
            "fileformat",
            {
              "filetype",
              icon_only = true,
            },
          },
          lualine_y = {
            {
              "filename",
              file_status = true,
              newfile_status = true,
              path = 1,
              shorting_target = 50,
              symbols = {
                modified = Lualine_signs["modified"],
                readonly = Lualine_signs["readonly"],
                unnamed = Lualine_signs["unnamed"],
                newfile = Lualine_signs["newfile"],
              },
            },
          },
          lualine_z = { "progress", "location" },
        },
      })
    end,
  },
}
