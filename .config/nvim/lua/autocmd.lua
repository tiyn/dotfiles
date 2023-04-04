-- autocmd

-- delete trailing whitespaces on save
vim.api.nvim_create_autocmd({'BufWritePre'},
{pattern = {'*'},
command = [[%s/\s\+$//e]],
})

-- formatting options
vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'markdown'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'java'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'javascript'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

-- cleanup certain files after leaving the editor
vim.api.nvim_create_autocmd({'VimLeave'},
{pattern = {'*.c'},
command = '!cclear'
})

vim.api.nvim_create_autocmd({'VimLeave'},
{pattern = {'*.tex'},
command = '!texclear %'
})

-- highlighting break line
vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'c'},
command = 'set colorcolumn=80'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'java'},
command = 'set colorcolumn=100'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'markdown'},
command = 'set colorcolumn=80'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'nim'},
command = 'set colorcolumn=80'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'python'},
command = 'set colorcolumn=80'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'tex'},
command = 'set colorcolumn=80'
})

-- conceallevel
vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'markdown'},
command = 'set conceallevel=2'
})

