-- keymap

-- set mapleader for hotkeys
vim.g.mapleader = ","

-- shortcut for split navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

-- unmap unwanted commands
vim.api.nvim_set_keymap('n', '<F1>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F4>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F9>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F10>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F11>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F12>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F2>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F3>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F4>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F5>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F6>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F7>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F8>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F9>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F10>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F11>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<F12>', '<NOP>', {noremap = true})

-- mapping Dictionaries
vim.api.nvim_set_keymap('n', '<F6>', ':setlocal spell! spelllang=de_de<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F7>', ':setlocal spell! spelllang=en_us<CR>', {noremap = true})

-- compiler for languages
vim.api.nvim_set_keymap('n', '<leader>c', ':w! | !compiler <c-r>%<CR>', {noremap = true})

-- open corresponding file (pdf/html/...)
vim.api.nvim_set_keymap('n', '<leader>p', ':!opout <c-r>%<CR><CR>', {noremap = true})


-- save file as sudo on files that require root permission
vim.api.nvim_set_keymap('c', 'w!!', '"silent! write !sudo tee % >/dev/null" <bar> edit!', {noremap = true})


-- alias for replacing
vim.api.nvim_set_keymap('n', '<leader>ss', ':%s//gI<Left><Left><Left>', {noremap = true})

-- irc compatibility for interactivity
vim.api.nvim_set_keymap('n', '<leader>is', ':.w >> in<cr>dd', {noremap = true})

-- majutsushi/tagbar
vim.api.nvim_set_keymap('n', '<F3>', ':TagbarToggle<CR>', {})

-- scrooloose/nerdtree
vim.api.nvim_set_keymap('n', '<F2>', ':NERDTreeToggle<CR>', {})

-- tpope/vim-fugitive
vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add %:p<CR><CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':Git diff<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gh', ':diffget //3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gr', ':Gread<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gu', ':diffget //2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':G<CR>', { noremap = true })

-- hrsh7th/nvim-cmp
vim.api.nvim_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gy', ':lua vim.lsp.buf.type_definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', ':lua vim.lsp.buf.rename()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F8>', ':lua vim.lsp.buf.format()<CR>', { noremap = true })
