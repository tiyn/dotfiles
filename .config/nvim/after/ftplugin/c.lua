vim.api.nvim_create_autocmd({ 'VimLeave' },
  {
    callback = function() os.execute('cclear') end
  })

vim.o.shiftwidth = 2
vim.o.softtabstop = 2
