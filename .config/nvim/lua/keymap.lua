-- highlighting yanked regions
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
})

local m = require 'mapx'.setup { global = true, whichkey = true }

-- unmap unwanted commands
m.nnoremap("<Space>",  '<NOP>')
m.inoremap("<F1>",  '<NOP>')
m.nnoremap("<F1>",  '<NOP>')
m.inoremap("<F2>",  '<NOP>')
m.inoremap("<F3>",  '<NOP>')
m.inoremap("<F4>",  '<NOP>')
m.inoremap("<F5>",  '<NOP>')
m.inoremap("<F6>",  '<NOP>')
m.inoremap("<F8>",  '<NOP>')
m.inoremap("<F9>",  '<NOP>')
m.nnoremap("<F9>",  '<NOP>')
m.inoremap("<F10>",  '<NOP>')
m.nnoremap("<F10>",  '<NOP>')
m.inoremap("<F11>",  '<NOP>')
m.nnoremap("<F11>",  '<NOP>')
m.inoremap("<F12>",  '<NOP>')
m.nnoremap("<F12>",  '<NOP>')
m.nnoremap("ZT",  '<NOP>')
m.nnoremap("Zt",  '<NOP>')

-- shortcut for split navigation
m.nnoremap("<C-h>",  '<C-w>h', 'splits: go to left split')
m.nnoremap("<C-j>",  '<C-w>j', 'splits: go to lower split')
m.nnoremap("<C-k>",  '<C-w>k', 'splits: go to upper split')
m.nnoremap("<C-l>",  '<C-w>l', 'splits: go to right split')

-- compiler for languages
m.nnoremap("<leader>c",   ':w! | !compiler <c-r>%<CR>', 'Compile current file')

-- save file as sudo on files that require root permission
m.cname("w", "Write")
m.cname("w!", "Write with sudo")
m.cnoremap("w!!",    'execute "silent! write !sudo tee % >/dev/null" <bar> edit!', 'Write file over with sudo')

-- easy substitution for whole file and line, visual mode
m.nname("<leader>s", "Substitute")
m.nnoremap("<leader>ss",    ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', 'Substitute: word under cursor')
m.nnoremap("<leader>sa",     ':%s//g<Left><Left>', 'Substitute: free form')

-- remap for dealing with word wrap
m.nmap('k', "v:count == 0 ? 'gk' : 'k'", { "expr", "silent" }, 'go up in wrapped lines')

m.nmap('j', "v:count == 0 ? 'gj' : 'j'", { "expr", "silent" }, 'go down in wrapped lines')

-- stevearc/aerial.nvim
m.nmap('<F3>', ':AerialToggle!<CR>', 'Aerial: Open side window')

-- nvim-tree/nvim-tree.lua
m.nmap("<F2>", ':NvimTreeToggle toggle<CR>', 'NvimTree: toggle')

-- numtostr/fterm.nvim
m.nname("<leader>t", "FTerm")
m.nnoremap("<leader>tt", require("FTerm").toggle, 'Terminal: toggle')
m.tnoremap("<leader>tt", require("FTerm").toggle, 'Terminal: toggle')


-- sindrets/diffview.nvim
m.nname("<leader>g", "Git")
local lazygit = require("FTerm"):new({
  cmd = 'lazygit',
})
m.nnoremap("<leader>tg", function() lazygit:toggle() end, 'Lazygit: toggle')
m.tnoremap("<leader>tg", function() lazygit:toggle() end, 'Lazygit: toggle')

m.nname("<leader>gd", "Git Diff")
m.nmap("<leader>gdo", ":DiffviewOpen<CR>", "Git Diff: open")
m.nmap("<leader>gdc", ":DiffviewClose<CR>", "Git Diff: close")

-- folke/trouble.nvim
m.nmap("<leader>x", ":TroubleToggle<CR>", "Trouble: toggle")

-- hrsh7th/nvim-cmp
m.nname("g", "LSP: goto")
m.nnoremap("gD", vim.lsp.buf.declaration, "LSP: goto declaration")
m.nnoremap("gd", vim.lsp.buf.definition, "LSP: goto definition")
m.nnoremap("gy", vim.lsp.buf.type_definition, "LSP: goto type definition")
m.nnoremap("gi", vim.lsp.buf.implementation, "LSP: list implementation")
m.nnoremap("gr", vim.lsp.buf.references, "LSP: list references")
m.nnoremap("K", vim.lsp.buf.hover, "LSP: show documentation")
m.nnoremap("<F8>", function() require("conform").format({ async = true, lsp_fallback = true }) end, "LSP: format")

-- filipdutescu/renamer.nvim
m.nnoremap("<F5>", require("renamer").rename, "LSP: rename")

-- nvim-telescope/telescope.nvim
m.nnoremap("<F4>",  ':Telescope find_files<CR>', "Telescope: find files")

-- kamykn/spelunker.vim
m.nnoremap("<F6>",  ':call spelunker#toggle()<CR>', "Spelunker: toggle")

-- kevinhwang91/nvim-ufo
m.nnoremap("K", function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, "UFO: peek folded section")

-- kevinhwang91/nvim-hlslens
m.nnoremap("n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  'silent', "HLSens: search forward")
m.nnoremap("N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  'silent', "HLSens: search backwards")
