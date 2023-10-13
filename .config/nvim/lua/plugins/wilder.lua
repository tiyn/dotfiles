return {
  -- improved wild menu
  {
    'gelguy/wilder.nvim',
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        lazy = true
      },
      'roxma/nvim-yarp',
      'roxma/vim-hug-neovim-rpc',
      'romgrk/fzy-lua-native'
    },
    config = function()
      local wilder = require('wilder')
      wilder.setup({
        modes = {':', '/', '?'},
        accept_key = '<CR>',
        reject_key = '<C-e>'
      })
      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.python_file_finder_pipeline({
            file_command = function(ctx, arg)
              if string.find(arg, '.') ~= nil then
                return {'fdfind', '-tf', '-H'}
              else
                return {'fdfind', '-tf'}
              end
            end,
            dir_command = {'fd', '-td'},
            filters = {'cpsm_filter'},
          }),
          wilder.substitute_pipeline({
            pipeline = wilder.python_search_pipeline({
              skip_cmdtype_check = 1,
              pattern = wilder.python_fuzzy_pattern({
                start_at_boundary = 0,
              }),
            }),
          }),
          wilder.cmdline_pipeline({
            fuzzy = 2,
            fuzzy_filter = wilder.lua_fzy_filter(),
          }),
          {
            wilder.check(function(ctx, x) return x == '' end),
            wilder.history(),
          },
          wilder.python_search_pipeline({
            pattern = wilder.python_fuzzy_pattern({
              start_at_boundary = 0,
            }),
          })
        ),
      })
      local highlighters = {
        wilder.pcre2_highlighter(),
        wilder.lua_fzy_highlighter(),
      }
      wilder.set_option('renderer', wilder.popupmenu_renderer({
        highlighter = highlighters,
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
      }))
    end,
  }
}
