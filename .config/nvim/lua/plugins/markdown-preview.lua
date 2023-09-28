return {
  -- preview for markdown filetypes
  {
    "iamcco/markdown-preview.nvim",
    ft = { 'markdown' },
    build = "cd app && yarn install",
    config = function()
      vim.cmd([[
          function OpenMarkdownPreview (url)
            execute "silent ! firefox --kiosk --new-window " . a:url
          endfunction
        ]])
      vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
    end
  }
}
