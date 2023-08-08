vim.o.go = 'a'
vim.o.showmode = false

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable mouse for all modes
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

-- basic color settings
vim.o.background = 'dark'

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

-- disable backupfiles
vim.o.nobackup = true
vim.o.nowritebackup = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- always show the signcolumn
vim.o.signcolumn = "yes"

-- enable persistent undo
vim.o.undofile = true
vim.o.undodir = vim.env.XDG_CACHE_HOME .. "/vim/undo"

-- python programs to use
vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'

-- display certain invisible chars
vim.opt.list = true
vim.opt.listchars:append "space:·"
vim.opt.listchars:append "eol:"

-- folding
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.conceallevel = 2

-- load general mapped keys
require('style')

-- set filetypes correctly by extension
require('autocmd')

-- load plugins (autoload all files in plugin folder)
require('loadplugins')

-- load general mapped keys
require('keymap')
