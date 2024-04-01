-- highlighting yanked regions
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({higroup="YankHighlight"})
  end,
})

-- gnikdroy/projections.nvim
local Session = require("projections.session")
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  callback = function()
    Session.store(vim.loop.cwd())
  end,
})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    if vim.fn.argc() ~= 0 then
      return
    end
    local session_info = Session.info(vim.loop.cwd())
    if session_info == nil then
      Session.restore_latest()
    else
      Session.restore(vim.loop.cwd())
    end
  end,
  desc = "Restore last session automatically",
})
