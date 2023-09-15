vim.api.nvim_create_autocmd({ 'BufEnter', 'FileType' },
  {
    callback = function() vim.o.foldenable = false end
  })

vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.textwidth = 100
vim.o.colorcolumn = "-0"
