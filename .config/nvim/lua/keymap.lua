-- unmap unwanted commands
vim.keymap.set("n", "Zt", "<NOP>", { noremap = true })
vim.keymap.set("n", "ZT", "<NOP>", { noremap = true })
vim.keymap.set("n", "<Space>", "<NOP>", { noremap = true })
-- vim.keymap.set("n", "<F1>", "<NOP>", { noremap = true })
-- vim.keymap.set("n", "<F2>", "<NOP>", { noremap = true })
-- vim.keymap.set("n", "<F3>", "<NOP>", { noremap = true })
-- vim.keymap.set("n", "<F4>", "<NOP>", { noremap = true })
-- vim.keymap.set("n", "<F5>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<F6>", "<NOP>", { noremap = true })
-- vim.keymap.set("n", "<F7>", "<NOP>", { noremap = true })
-- vim.keymap.set("n", "<F8>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<F9>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<F10>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<F11>", "<NOP>", { noremap = true })
vim.keymap.set("n", "<F12>", "<NOP>", { noremap = true })

-- shortcuts for quitting
vim.keymap.set("n", "ZA", ":xa<CR>", { desc = "Exit: write and quit all buffers", noremap = true })
vim.keymap.set("n", "ZQ", ":conf q<CR>", { desc = "Exit: quit current buffer", noremap = true })
vim.keymap.set("n", "ZZ", ":x<CR>", { desc = "Exit: write and quit current buffer", noremap = true })

-- shortcut for split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigation: go to left window", noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigation: go to lower window", noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigation: go to upper window", noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigation: go to right window", noremap = true })

-- remap for dealing with word wrap
vim.keymap.set("n", "j", "gj", { desc = "Navigation: go down in wrapped lines", silent = true })
vim.keymap.set("n", "k", "gk", { desc = "Navigation: go up in wrapped lines", silent = true })

-- compiler for languages
vim.keymap.set("n", "<leader>c", ":w! | !compiler <c-r>%<CR>", {
  desc = "Compile: current file",
  noremap = true,
})

vim.keymap.set("n", "w!!", 'execute "silent! write !sudo tee % >/dev/null" <bar> edit!', {
  desc = "Write: overwrite file over with sudo",
  noremap = true,
})
