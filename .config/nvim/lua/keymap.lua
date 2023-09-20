-- set mapleader for hotkeys
vim.g.mapleader = ","

-- unmap unwanted commands
vim.keymap.set({ 'n', 'i' }, '<F1>', '<NOP>', { noremap = true })
vim.keymap.set('i', '<F2>', '<NOP>', { noremap = true })
vim.keymap.set('i', '<F3>', '<NOP>', { noremap = true })
vim.keymap.set('i', '<F4>', '<NOP>', { noremap = true })
vim.keymap.set('i', '<F5>', '<NOP>', { noremap = true })
vim.keymap.set('i', '<F6>', '<NOP>', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<F7>', '<NOP>', { noremap = true })
vim.keymap.set('i', '<F8>', '<NOP>', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<F9>', '<NOP>', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<F10>', '<NOP>', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<F11>', '<NOP>', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<F12>', '<NOP>', { noremap = true })

-- shortcut for split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- compiler for languages
vim.keymap.set('n', '<leader>c', ':w! | !compiler <c-r>%<CR>', { noremap = true })

-- save file as sudo on files that require root permission
vim.keymap.set('c', 'w!!', 'execute "silent! write !sudo tee % >/dev/null" <bar> edit!', { noremap = true })

-- alias for replacing
vim.keymap.set('n', '<leader>ss', ':%s//gI<Left><Left><Left>', { noremap = true })

-- irc compatibility for interactivity
vim.keymap.set('n', '<leader>is', ':.w >> in<cr>dd', { noremap = true })

-- SmiteshP/nvim-navbuddy
vim.keymap.set('n', '<F3>', ':Navbuddy<CR>', {})

-- nvim-tree/nvim-tree.lua
vim.keymap.set('n', '<F2>', ':NvimTreeToggle toggle<CR>', {})

-- numtostr/fterm.nvim
vim.keymap.set({ 'n', 't' }, '<leader>t', require("FTerm").toggle, { noremap = true })

local lazygit = require("FTerm"):new({
    cmd = 'lazygit',
})
vim.keymap.set({ 'n', 't' }, '<leader>gt', function() lazygit:toggle() end)

-- sindrets/diffview.nvim
vim.keymap.set( 'n', '<leader>gdo', ":DiffviewOpen<CR>")
vim.keymap.set( 'n', '<leader>gdc', ":DiffviewClose<CR>")

-- folke/trouble.nvim
vim.keymap.set( 'n', '<leader>x', ":TroubleToggle<CR>")

-- hrsh7th/nvim-cmp
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true })
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { noremap = true })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true })
vim.keymap.set('n', '<F8>', vim.lsp.buf.format, { noremap = true })

-- filipdutescu/renamer.nvim
vim.keymap.set('n', '<F5>', require("renamer").rename, { noremap = true })

-- nvim-telescope/telescope.nvim
vim.keymap.set('n', '<F4>', ':Telescope find_files<CR>', { noremap = true })

-- kamykn/spelunker.vim
vim.keymap.set('n', '<F6>', ':call spelunker#toggle()<CR>', { noremap = true })
vim.keymap.set('n', 'ZT', '<NOP>', { noremap = true })
vim.keymap.set('n', 'Zt', '<NOP>', { noremap = true })

-- kevinhwang91/nvim-ufo
vim.keymap.set('n', 'K', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)
