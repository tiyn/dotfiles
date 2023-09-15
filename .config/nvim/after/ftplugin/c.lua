vim.api.nvim_create_autocmd({ 'VimLeave' },
  {
    command = '!cclear'
  })

vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.textwidth = 80
vim.o.colorcolumn = "-0"
