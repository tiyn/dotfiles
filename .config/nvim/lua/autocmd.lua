-- autocmd

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

-- settings for filetype: c

vim.api.nvim_create_autocmd({'VimLeave'},
{pattern = {'c'},
command = '!cclear'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'c'},
command = 'set colorcolumn=80'
})

-- settings for filetype: java

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'java'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'java'},
command = 'set colorcolumn=100'
})

-- settings for filetype: javascript

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'javascript'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

-- settings for filetype: lua

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'lua'},
command = 'setlocal shiftwidth=2 softtabstop=2',
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'lua'},
command = 'set colorcolumn=100'
})

-- settings for filetype: markdown

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

-- settings for filetype: nim

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'nim'},
command = 'set colorcolumn=80'
})

-- settings for filetype: python

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'python'},
command = 'set colorcolumn=80'
})

-- settings for filetype: tex

vim.api.nvim_create_autocmd({'VimLeave'},
{pattern = {'tex'},
command = '!texclear %'
})

vim.api.nvim_create_autocmd({'BufEnter', 'FileType'},
{pattern = {'tex'},
command = 'set colorcolumn=80'
})
