vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("tidy").opts.enabled_on_save = false
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
  callback = function()
    if vim.o.ma then
      require("tidy").run()
    end
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    os.execute("texclear " .. vim.fn.expand("%"))
  end,
})

vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.textwidth = 80
