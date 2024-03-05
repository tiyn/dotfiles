-- highlighting yanked regions
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
})

-- setup keymap function
local m = require 'mapx'.setup { global = true, whichkey = true }

-- setup keymap groups
m.nname("g", "LSP: goto")
m.cname("w", "Write")
m.cname("w!", "Write: overwrite")
m.nname("<leader>g", "Git")
m.nname("<leader>gd", "Git: diff")
m.nname("<leader>s", "Substitute")
m.nname("<leader>t", "Terminal")

-- unmap unwanted commands
m.nnoremap("Zt", '<NOP>')
m.nnoremap("ZT", '<NOP>')
m.nnoremap("<Space>", '<NOP>')
m.inoremap("<F2>", '<NOP>')
m.inoremap("<F3>", '<NOP>')
m.inoremap("<F4>", '<NOP>')
m.inoremap("<F5>", '<NOP>')
m.inoremap("<F6>", '<NOP>')
m.inoremap("<F8>", '<NOP>')
m.inoremap("<F9>", '<NOP>')
m.nnoremap("<F9>", '<NOP>')
m.inoremap("<F10>", '<NOP>')
m.nnoremap("<F10>", '<NOP>')
m.inoremap("<F11>", '<NOP>')
m.nnoremap("<F11>", '<NOP>')
m.inoremap("<F12>", '<NOP>')
m.nnoremap("<F12>", '<NOP>')

-- shortcut for split navigation
m.nnoremap("<C-h>", '<C-w>h', 'Navigation: go to left split')
m.nnoremap("<C-j>", '<C-w>j', 'Navigation: go to lower split')
m.nnoremap("<C-k>", '<C-w>k', 'Navigation: go to upper split')
m.nnoremap("<C-l>", '<C-w>l', 'Navigation: go to right split')

-- remap for dealing with word wrap
m.nmap('j', "v:count == 0 ? 'gj' : 'j'", { "expr", "silent" }, 'Navigation: go down in wrapped lines')
m.nmap('k', "v:count == 0 ? 'gk' : 'k'", { "expr", "silent" }, 'Navigation: go up in wrapped lines')

-- compiler for languages
m.nnoremap("<leader>c", ':w! | !compiler <c-r>%<CR>', 'Compile: current file')

-- save file as sudo on files that require root permission
m.cnoremap("w!!", 'execute "silent! write !sudo tee % >/dev/null" <bar> edit!', 'Write: overwrite file over with sudo')

-- tpope/vim-abolish
m.nnoremap("<leader>sa", ':%S//g<Left><Left>', 'Substitute: free form')
m.nnoremap("<leader>ss", ':%S/\\<<C-r><C-w>\\>//g<Left><Left>', 'Substitute: word under cursor')

-- stevearc/aerial.nvim
m.nmap('<F3>', ':AerialToggle!<CR>', 'CTags: toggle')

-- nvim-tree/nvim-tree.lua
m.nmap("<F2>", ':NvimTreeToggle toggle<CR>', 'File tree: toggle')

-- mbbill/undotree
m.nmap("<F1>", ':UndotreeToggle<CR>', 'Undo tree: toggle')

-- numtostr/fterm.nvim
m.nnoremap("<leader>tt", require("FTerm").toggle, 'Terminal: open')
m.tnoremap("<leader>tt", require("FTerm").toggle, 'Terminal: open')
local lazygit = require("FTerm"):new({
  cmd = 'lazygit',
})
m.nnoremap("<leader>gt", function() lazygit:toggle() end, 'Git: open lazygit')
m.tnoremap("<leader>gt", function() lazygit:toggle() end, 'Git: open lazygit')
m.nnoremap("<leader>tg", function() lazygit:toggle() end, 'Terminal: open lazygit')
m.tnoremap("<leader>tg", function() lazygit:toggle() end, 'Terminal: open lazygit')

-- sindrets/diffview.nvim
m.nmap("<leader>gdo", ":DiffviewOpen<CR>", "Git: open diff")
m.nmap("<leader>gdc", ":DiffviewClose<CR>", "Git: close diff")

-- folke/trouble.nvim
m.nmap("<leader>x", ":TroubleToggle<CR>", "LSP: toggle error list")

-- hrsh7th/nvim-cmp
m.nnoremap("gd", vim.lsp.buf.definition(), "LSP: goto definition")
m.nnoremap("gD", vim.lsp.buf.declaration(), "LSP: goto declaration")
m.nnoremap("gi", vim.lsp.buf.implementation(), "LSP: list implementation")
m.nnoremap("gr", vim.lsp.buf.references(), "LSP: list references")
m.nnoremap("gy", vim.lsp.buf.type_definition(), "LSP: goto type definition")
m.nnoremap("K", vim.lsp.buf.hover(), "LSP: show documentation")
m.nnoremap("<F8>", function() require("conform").format({ async = true, lsp_fallback = true }) end, "LSP: format")

-- filipdutescu/renamer.nvim
m.nnoremap("<F5>", require("renamer").rename, "LSP: rename")

-- nvim-telescope/telescope.nvim
m.nnoremap("<F4>", ':Telescope find_files<CR>', "Telescope: find files")

-- kamykn/spelunker.vim
m.nnoremap("<F6>", ':call spelunker#toggle()<CR>', "Spelling: toggle spell check")

-- kevinhwang91/nvim-ufo
m.nnoremap("K", function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, "LSP: peek folded section")

-- kevinhwang91/nvim-hlslens
m.nnoremap("n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  'silent', "Search: search forward")
m.nnoremap("N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  'silent', "Search: search backwards")
