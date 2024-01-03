vim.api.nvim_create_autocmd({ 'VimEnter' },
  {
    callback = function()
      require("knap").toggle_autopreviewing()
    end
  })

vim.api.nvim_create_autocmd({ 'BufEnter' },
  {
    callback = function()
      vim.o.foldenable = false
    end
  })

vim.api.nvim_create_autocmd({ 'VimLeave' },
  {
    callback = function()
      os.execute('mdclear ' .. vim.fn.expand('%'))
    end
  })

vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.textwidth = 100

-- frabjous/knap
vim.keymap.set('n', '<leader>p', require("knap").toggle_autopreviewing, { noremap = true })
