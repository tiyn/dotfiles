vim.o.go = 'a'
vim.o.showmode = false

-- enable mouse for all modes
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

-- setting Tab-length
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- splits open at the bottom and right
vim.o.splitbelow = true
vim.o.splitright = true

-- disable case sensitive matching
vim.o.ignorecase = true

-- enable nocompatible mode
vim.o.nocompatible = true

-- enable syntax highlighting
vim.o.syntax = true

-- enable true colors
vim.o.termguicolors = true

-- set utf-8 encoding
vim.o.encoding = "utf-8"

-- show relative numbers on left side
vim.o.number = true
vim.o.relativenumber = true

-- speedup vim with long lines
vim.o.ttyfast = true
vim.o.lazyredraw = true

-- textEdit might fail without hidden
vim.o.hidden = true

-- disable Backupfiles for Lsp
vim.o.nobackup = true
vim.o.nowritebackup = true

-- always show the signcolumn
vim.o.signcolumn = "yes"

-- enable persistent undo
vim.o.undofile = true
vim.o.undodir = vim.env.XDG_CACHE_HOME .. "/vim/undo"

-- delete trailing whitespaces on save
vim.api.nvim_create_autocmd({'BufWritePre'},
{pattern = {'*'},
command = [[%s/\s\+$//e]],
})

-- python programs to use
vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'

-- load filetype specific mappings and commands
require('filetype')

-- load general mapped keys
require('keymap')

-- load general colorscheme
require('colorscheme')

-- load plugins (autoload all files in plugin folder)
require('loadplugins')
