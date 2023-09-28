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
        modes = { ':', '/', '?' },
        accept_key = '<CR>',
        reject_key = '<C-e>'
      })
      wilder.set_option('renderer', wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
      }))
      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.python_file_finder_pipeline({
            file_command = { 'find', '.', '-type', 'f', '-printf', '%P\n' },
            dir_command = { 'find', '.', '-type', 'd', '-printf', '%P\n' },
            filters = { 'fuzzy_filter', 'difflib_sorter' },
          }),
          wilder.cmdline_pipeline({
            language = 'python',
            fuzzy = 2,
          }),
          wilder.python_search_pipeline({
            pattern = wilder.python_fuzzy_pattern(),
            sorter = wilder.python_difflib_sorter(),
            engine = 're',
          })
        ),
      })
    end,
  }
}
