vim.o.go = "a"
vim.o.showmode = false

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable mouse for all modes
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

-- basic color settings
vim.o.background = "dark"

-- setting Tab-length
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- splits open at the bottom and right
vim.o.splitbelow = true
vim.o.splitright = true

-- disable case sensitive matching
vim.o.ignorecase = true
vim.o.smartcase = true

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
-- vim.o.lazyredraw = true

-- decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- enable break indent
vim.o.breakindent = true

-- textedit might fail without hidden
vim.o.hidden = true

-- disable backupfiles
vim.o.nobackup = true
vim.o.nowritebackup = true

-- set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- set completion option for command mode
vim.o.wildmode = "longest:full,full"

-- minimum number of lines around the cursor
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8

-- always show the signcolumn
vim.o.signcolumn = "yes"

-- enable persistent undo
vim.o.undofile = true
vim.o.undodir = vim.env.XDG_CACHE_HOME .. "/vim/undo"

-- python programs to use
vim.g.python_host_prog = "/usr/bin/python2"
vim.g.python3_host_prog = "/usr/bin/python3"

-- folding
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldexpr = "expr"
vim.o.foldenable = true
vim.o.conceallevel = 0
vim.g.markdown_folding = 1

-- standard settings for colorcolumn and tabbing
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.textwidth = 80

-- read files correctly
vim.filetype.add({
  extension = {
    c = "c",
    h = "c",
    html = "html",
    java = "java",
    js = "javascript",
    lua = "lua",
    md = "markdown",
    nim = "nim",
    py = "python",
    sage = "python",
    sh = "bash",
    tex = "tex",
  },
})

-- set mapleader for hotkeys
vim.g.mapleader = ","

-- load general mapped keys
require("style")

-- load dictionaries and helper functions
require("dictionaries")

-- load plugins (autoload all files in plugin folder)
require("loadplugins")

-- load commands to be run automatically
require("autocmd")

-- load general mapped keys
require("keymap")

vim.cmd([[
set foldopen-=hor
set foldclose-=hor
]])

-- Save localoptions to session file
vim.opt.sessionoptions:append("localoptions")
