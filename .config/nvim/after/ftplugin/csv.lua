vim.api.nvim_create_autocmd({ 'VimEnter' },
  {
    callback = function()
      require("csvview").enable()
    end
  })

vim.o.textwidth = 0
