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

-- the following keymap settings are plugin dependent

-- frabjous/knap
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    vim.keymap.set('n', '<leader>p', ':lua require("knap").toggle_autopreviewing()<CR>', { noremap = true })
  end,
})

-- iamcco/markdown-preview.nvim
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.keymap.set('n', '<leader>p', ':MarkdownPreviewToggle<CR>', { noremap = true })
  end,
})

-- SmiteshP/nvim-navbuddy
vim.keymap.set('n', '<F3>', ':Navbuddy<CR>', {})

-- nvim-tree/nvim-tree.lua
vim.keymap.set('n', '<F2>', ':NvimTreeToggle toggle<CR>', {})

-- numtostr/fterm.nvim
vim.keymap.set('n', '<leader>t', ':lua require("FTerm").toggle()<CR>', { noremap = true })
vim.keymap.set('t', '<leader>t', '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', { noremap = true })
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
vim.keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true })
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.keymap.set('n', 'gy', ':lua vim.lsp.buf.type_definition()<CR>', { noremap = true })
vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true })
vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true })
vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true })
vim.keymap.set('n', '<F8>', ':lua vim.lsp.buf.format()<CR>', { noremap = true })

-- filipdutescu/renamer.nvim
vim.keymap.set('n', '<F5>', ':lua require("renamer").rename()<CR>', { noremap = true })

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
    -- choose one of coc.nvim and nvim lsp
    vim.fn.CocActionAsync('definitionHover')             -- coc.nvim
    vim.lsp.buf.hover()
  end
end)
