return {
  -- statusline
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "tiyn/tccs.nvim",
    "f-person/git-blame.nvim",
    "tiyn/action-hints.nvim",
  },
  lazy = false,
  opts = {
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
          function()
            return require("gitblame").get_current_blame_text()
          end,
          cond = function()
            return require("gitblame").is_blame_text_available()
          end,
        },
      },
      lualine_c = {},
      lualine_x = {
        function()
          return require("action-hints").statusline()
        end,
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
  },
}
