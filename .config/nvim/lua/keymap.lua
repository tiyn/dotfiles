-- setup keymap function
local wk = require("which-key")
local lazygit = require("FTerm"):new({ cmd = "lazygit" })

wk.add({
  -- setup keymap groups
  {mode = "n", "g", desc = "LSP: goto"},
  {mode = "n", "gp", desc = "LSP: preview"},
  {mode = "c", "w", desc = "Write"},
  {mode = "c", "w!", desc = "Write: overwrite"},
  {mode = "n", "<leader>g", desc = "Git"},
  {mode = "n", "<leader>f", desc = "Telescope: find"},
  {mode = "n", "<leader>gd", desc = "Git: diff"},
  {mode = "n", "<leader>s", desc = "Substitute"},
  {mode = "n", "<leader>t", desc = "Terminal"},
  {mode = "n", "<C-W>", desc = "Navigation"},
  -- unmap unwanted commands
  {mode = "n", "Zt", "<NOP>", noremap = true},
  {mode = "n", "ZT", "<NOP>", noremap = true},
  {mode = "n", "<Space>", "<NOP>", noremap = true},
  {mode = "n", "<F1>", "<NOP>", noremap = true},
  {mode = "n", "<F2>", "<NOP>", noremap = true},
  {mode = "n", "<F3>", "<NOP>", noremap = true},
  {mode = "n", "<F4>", "<NOP>", noremap = true},
  {mode = "n", "<F5>", "<NOP>", noremap = true},
  {mode = "n", "<F6>", "<NOP>", noremap = true},
  {mode = "n", "<F7>", "<NOP>", noremap = true},
  {mode = "n", "<F8>", "<NOP>", noremap = true},
  {mode = "n", "<F9>", "<NOP>", noremap = true},
  {mode = "n", "<F10>", "<NOP>", noremap = true},
  {mode = "n", "<F11>", "<NOP>", noremap = true},
  {mode = "n", "<F12>", "<NOP>", noremap = true},
  -- spell
  {mode = "n", "<F6>s", "z=", desc = "Spell: display suggestions"},
  -- shortcuts for quitting
  {mode = "n", "ZA", ":xa<CR>", desc = "Exit: write and quit all buffers", noremap = true},
  {mode = "n", "ZQ", ":conf q<CR>", desc = "Exit: quit current buffer", noremap = true},
  {mode = "n", "ZZ", ":x<CR>", desc = "Exit: write and quit current buffer", noremap = true},
  -- shortcut for split navigation
  {mode = "n", "<C-h>", "<C-w>h", desc = "Navigation: go to left window", noremap = true},
  {mode = "n", "<C-j>", "<C-w>j", desc = "Navigation: go to lower window", noremap = true},
  {mode = "n", "<C-k>", "<C-w>k", desc = "Navigation: go to upper window", noremap = true},
  {mode = "n", "<C-l>", "<C-w>l", desc = "Navigation: go to right window", noremap = true},
  -- remap for dealing with word wrap
  {mode = "n",  "j", "gj", desc = "Navigation: go down in wrapped lines", silent = true},
  {mode = "n", "k", "gk", desc = "Navigation: go up in wrapped lines", silent = true},
  -- compiler for languages
  {mode = "n", "<leader>c", ":w! | !compiler <c-r>%<CR>", desc = "Compile: current file", noremap = true},
  {mode = "n", "w!!", 'execute "silent! write !sudo tee % >/dev/null" <bar> edit!', desc = "Write: overwrite file over with sudo", noremap = true},
  -- tpope/vim-abolish
  {mode = "n", "<leader>sa", ":%S//g<Left><Left>", desc = "Substitute: free form", noremap = true},
  {mode = "n", "<leader>ss", ":%S/\\<<C-r><C-w>\\>//g<Left><Left>", desc = "Substitute: word under cursor", noremap = true},
  -- simrat39/symbols-outline.nvim
  {mode = "n", "<F3>", ":SymbolsOutline<CR>", desc = "CTags: toggle"},
  -- nvim-tree/nvim-tree.lua
  {mode = "n", "<F2>", ":NvimTreeToggle toggle<CR>", desc = "File tree: toggle"},
  -- mbbill/undotree
  {mode = "n", "<F1>", ":UndotreeToggle<CR>", desc = "Undo tree: toggle"},
  -- amrbashir/nvim-docs-view
  {mode = "n", "go", ":DocsViewToggle<CR>", desc = "LSP: toggle documentation window", noremap = true},
  -- numtostr/fterm.nvim
  {mode = "n", "<leader>tt", require("FTerm").toggle, desc = "Terminal: open", noremap = true},
  {mode = "n", "<leader>gt", function() lazygit:toggle() end, desc = "Git: open lazygit", noremap = true},
  {mode = "n", "<leader>tg", function() lazygit:toggle() end, desc = "Terminal: open lazygit", noremap = true},
  {mode = "n", "<leader>tg", function() lazygit:toggle() end, desc = "Terminal: open lazygit", noremap = true},
  -- sindrets/diffview.nvim
  {mode = "n", "<leader>gdo", ":DiffviewOpen<CR>", desc = "Git: open diff"},
  {mode = "n", "<leader>gdc", ":DiffviewClose<CR>", desc = "Git: close diff"},
  -- folke/trouble.nvim
  {mode = "n", "<leader>x", ":TroubleToggle<CR>", desc = "LSP: toggle error list"},
  -- hrsh7th/nvim-cmp
  {mode = "n", "gd", vim.lsp.buf.definition(), desc = "LSP: goto definition", noremap = true},
  {mode = "n", "gD", vim.lsp.buf.declaration(), desc = "LSP: goto declaration", noremap = true},
  {mode = "n", "gi", vim.lsp.buf.implementation(), desc = "LSP: list implementation", noremap = true},
  {mode = "n", "gr", function() vim.lsp.buf.references() end, desc = "LSP: list references", noremap = true},
  {mode = "n", "K", vim.lsp.buf.hover(), desc = "LSP: show documentation", noremap = true},
  {mode = "n", "<F8>", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "LSP: format", noremap = true},
  -- rmagatti/goto-preview
  {mode = "n", "gpd", function() require("goto-preview").goto_preview_definition() end, desc = "LSP: preview definition", noremap = true},
  {mode = "n", "gpy", function() require("goto-preview").goto_preview_type_definition() end, desc = "LSP: preview type definition", noremap = true},
  {mode = "n", "gpi", function() require("goto-preview").goto_preview_implementation() end, desc = "LSP: list preview implementation", noremap = true},
  {mode = "n", "gpD", function() require("goto-preview").goto_preview_declaration() end, desc = "LSP: preview declaration", noremap = true},
  {mode = "n", "gpr", function() require("goto-preview").goto_preview_references() end, desc = "LSP: list preview references", noremap = true},
  {mode = "n", "gpc", function() require("goto-preview").close_all_win() end, desc = "LSP: close all preview windows", noremap = true},
  -- filipdutescu/renamer.nvim
  {mode = "n", "<F5>", function() require("renamer").rename() end, desc = "LSP: rename", noremap = true},
  -- nvim-telescope/telescope.nvim
  {mode = "n", "<F4>", ":Telescope find_files<CR>", desc = "Telescope: find files", noremap = true},
  {mode = "n", "<leader>ff", ":Telescope find_files<CR>", desc = "Telescope: find files", noremap = true},
  -- kamykn/spelunker.vim
  {mode = "n", "<F6>t", ":call spelunker#toggle()<CR>", desc = "Spelunker: toggle spell check", noremap = true},
  {mode = "n", "<F6>l", function() if vim.opt.spelllang._value == "de_de" then vim.opt.spelllang = "en_us" print("Spell language set to en_us") else vim.opt.spelllang = "de_de" print("Spell language set to de_de") end vim.opt.spell = false end, desc = "Spell: toggle spell language", noremap = true},
  -- kevinhwang91/nvim-ufo
  {mode = "n", "K", function() local winid = require("ufo").peekFoldedLinesUnderCursor() if not winid then vim.lsp.buf.hover() end end, desc = "LSP: peek folded section", noremap = true},
  -- kevinhwang91/nvim-hlslens
  {mode = "n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "Search: search forward", noremap = true, silent = true},
  {mode = "n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], desc = "Search: search backwards", noremap = true, silent = true},
  -- sindrets/winshift.nvim
  {mode = "n", "<C-W>m", ":WinShift<CR>", desc = "Navigation: enter window shift mode", noremap = true},
  -- ggandor/leap.nvim
  {mode = "n", "f", "<Plug>(leap-forward)", desc = "Navigation: enter leap mode for forward movement", noremap = true},
  {mode = "n", "F", "<Plug>(leap-backward)", desc = "Navigation: enter leap mode for backwards movement", noremap = true},
  {mode = "n", "gf", "<Plug>(leap-from-window)", desc = "Navigation: enter leap mode for other windows", noremap = true},
  -- gnikdroy/projections.nvim
  {mode = "n", "<leader>fp", function() vim.cmd("Telescope projections") end, desc = "Telescope: find projects", noremap = true},
})
