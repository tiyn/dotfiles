return {
  -- showing color of hex values, etc
  {
    'nvchad/nvim-colorizer.lua',
    opts = {
      filetypes = {
        '*',
        '!markdown'
      },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        css_fn = true,
        mode = "virtualtext",
        virtualtext = " ",
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {
        "*",
        "!prompt",
        "!popup"
      },
    }
  }
}
