vim.api.nvim_create_autocmd({ 'VimLeave' },
  {
    command = '!cclear'
  })

vim.o.textwidth = 80
vim.o.colorcolumn = "-0"
