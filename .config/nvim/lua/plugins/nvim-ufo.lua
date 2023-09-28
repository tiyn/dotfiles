return {
  -- folding improvements
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('ufo').setup()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'FileType' },
        {
          pattern = { '*' },
          callback = function() require("ufo").closeAllFolds() end
        })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'FileType' },
        {
          pattern = { '*' },
          callback = function() require("ufo").openAllFolds() end
        })
    end
  }
}
