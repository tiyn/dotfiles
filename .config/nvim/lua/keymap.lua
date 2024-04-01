-- setup keymap function
local m = require 'mapx'.setup { global = true, whichkey = true }

-- setup keymap groups
m.nname("g", "LSP: goto")
m.nname("gp", "LSP: preview")
m.cname("w", "Write")
m.cname("w!", "Write: overwrite")
m.nname("<leader>g", "Git")
m.nname("<leader>f", "Telescope: find ...")
m.nname("<leader>gd", "Git: diff")
m.nname("<leader>s", "Substitute")
m.nname("<leader>t", "Terminal")
m.nname("<C-W>", "Navigation")

-- unmap unwanted commands
m.nnoremap("Zt", '<NOP>')
m.nnoremap("ZT", '<NOP>')
m.nnoremap("ZQ", '<NOP>')
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

-- shortcuts for quitting
m.nnoremap("ZQ", ':conf q<CR>', 'Exit: quit current buffer')
m.nnoremap("ZZ", ':x<CR>', 'Exit: write and quit current buffer')
m.nnoremap("ZA", ':conf xa<CR>', 'Exit: write and quit all buffers')

-- shortcut for split navigation
m.nnoremap("<C-h>", '<C-w>h', 'Navigation: go to left window')
m.nnoremap("<C-j>", '<C-w>j', 'Navigation: go to lower window')
m.nnoremap("<C-k>", '<C-w>k', 'Navigation: go to upper window')
m.nnoremap("<C-l>", '<C-w>l', 'Navigation: go to right window')

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

-- simrat39/symbols-outline.nvim
m.nmap('<F3>', ':SymbolsOutline<CR>', 'CTags: toggle')

-- nvim-tree/nvim-tree.lua
m.nmap("<F2>", ':NvimTreeToggle toggle<CR>', 'File tree: toggle')

-- mbbill/undotree
m.nmap("<F1>", ':UndotreeToggle<CR>', 'Undo tree: toggle')

-- amrbashir/nvim-docs-view
m.nnoremap("go", ':DocsViewToggle<CR>', 'LSP: toggle documentation window')

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
m.nnoremap("gr", function() vim.lsp.buf.references() end, "LSP: list references")
m.nnoremap("gy", vim.lsp.buf.type_definition(), "LSP: goto type definition")
m.nnoremap("K", vim.lsp.buf.hover(), "LSP: show documentation")
m.nnoremap("<F8>", function() require("conform").format({ async = true, lsp_fallback = true }) end, "LSP: format")

-- rmagatti/goto-preview
m.nnoremap("gpd", function() require('goto-preview').goto_preview_definition() end, "LSP: preview definition")
m.nnoremap("gpy", function() require('goto-preview').goto_preview_type_definition() end, "LSP: preview type definition")
m.nnoremap("gpi", function() require('goto-preview').goto_preview_implementation() end, "LSP: list preview implementation")
m.nnoremap("gpD", function() require('goto-preview').goto_preview_declaration() end, "LSP: preview declaration")
m.nnoremap("gpr", function() require('goto-preview').goto_preview_references() end, "LSP: list preview references")
m.nnoremap("gpc", function() require('goto-preview').close_all_win() end, "LSP: close all preview windows")

-- filipdutescu/renamer.nvim
m.nnoremap("<F5>", function() require("renamer").rename() end, "LSP: rename")

-- nvim-telescope/telescope.nvim
m.nnoremap("<F4>", ':Telescope find_files<CR>', "Telescope: find files")
m.nnoremap("<leader>ff", ':Telescope find_files<CR>', "Telescope: find files")

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

-- sindrets/winshift.nvim
m.nnoremap("<C-W>m", ":WinShift<CR>", "Navigation: enter window shift mode")

-- ggandor/leap.nvim
m.nnoremap("s", "<Plug>(leap-forward)", "Navigation: enter leap mode for forward movement")
m.nnoremap("S", "<Plug>(leap-backward)", "Navigation: enter leap mode for backwards movement")
m.nnoremap("gs", "<Plug>(leap-from-window", "Navigation: enter leap mode for other windows")

-- gnikdroy/projections.nvim
m.nnoremap("<leader>fp", function() vim.cmd("Telescope projections") end, "Telescope: find projects")
