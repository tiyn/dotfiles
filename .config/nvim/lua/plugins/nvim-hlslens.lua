return {
  -- improved virtual text
  "kevinhwang91/nvim-hlslens",
  keys = {
    {
      "n",
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      desc = "Search: search forward",
    },
    {
      "N",
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      desc = "Search: search backwards",
    },
  },
  opts = {
    calm_down = true,
  },
}
