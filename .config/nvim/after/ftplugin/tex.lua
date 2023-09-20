vim.api.nvim_create_autocmd({ 'VimLeave' },
  {
    callback = function() os.execute('texclear ' .. vim.fn.expand('%')) end
  })

vim.o.shiftwidth = 2
vim.o.softtabstop = 2
