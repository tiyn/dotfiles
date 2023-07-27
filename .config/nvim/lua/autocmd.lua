-- read files correctly
vim.filetype.add({
extension = {
    c = 'c',
    h = 'c',
    html = 'html',
    java = 'java',
    js = 'javascript',
    lua = 'lua',
    md = 'markdown',
    nim = 'nim',
    py = 'python',
    tex = 'tex',
}})

-- delete trailing whitespaces on save
vim.api.nvim_create_autocmd({'BufWritePre'},
{pattern = {'*'},
command = [[%s/\s\+$//e]],
})

-- c

vim.api.nvim_create_autocmd({'VimLeave'},
{pattern = {'c'},
command = '!cclear'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'c'},
command = 'set colorcolumn=80'
})

-- java

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'java'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'java'},
command = 'set colorcolumn=100'
})

-- javascript

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'javascript'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

-- lua

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'lua'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'lua'},
command = 'set colorcolumn=100'
})

-- markdown

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'markdown'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'markdown'},
command = 'set colorcolumn=100'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'markdown'},
command = 'set conceallevel=2'
})

-- nim

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'nim'},
command = 'set colorcolumn=80'
})

-- python

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'python'},
command = 'set colorcolumn=80'
})

-- tex

vim.api.nvim_create_autocmd({'VimLeave'},
{pattern = {'tex'},
command = '!texclear %'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'tex'},
command = 'set colorcolumn=80'
})
