-- filetype

-- read files correctly
vim.filetype.add({
pattern = {
    ['.*.lua'] = 'lua',
    ['.*.h'] = 'c',
    ['.*.html'] = 'html',
    ['.*.nim'] = 'nim',
    ['.*.py'] = 'python',
    ['.*.tex'] = 'tex',
}})

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

-- formatting programs
vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'c'},
command = 'setlocal formatprg=astyle --mode=c --style=ansi',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'c'},
command = 'noremap <F8> gggqG',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'html'},
command = 'noremap <F8> :silent %!tidy -q -i --show-errors 0 <CR>',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'java'},
command = 'setlocal formatprg=astyle --indent=spaces=2 --style=google',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'java'},
command = 'noremap <F8> gggqG',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'markdown'},
command = 'noremap <F8> :silent %!prettier --stdin-filepath % <CR>',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'nim'},
command = 'noremap <F8> :silent !nimpretty %<CR>',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'nim'},
command = 'noremap <F8> gggqG',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'python'},
command = 'setlocal formatprg=autopep8 "%"',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'python'},
command = 'noremap <F8> gggqG',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'tex', 'latex'},
command = 'setlocal formatprg=latexindent',
})

vim.api.nvim_create_autocmd({'FileType'},
{pattern = {'tex', 'latex'},
command = 'noremap <F8> gggqG',
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

