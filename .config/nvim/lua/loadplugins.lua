-- loadplugins

-- bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- load plugins with packer
return require("packer").startup(function(use)
  -- package manager (first entry)
  use { 'wbthomason/packer.nvim' }

  -- indicate git diff status of line
  use { 'lewis6991/gitsigns.nvim' }

  -- improved java syntax highlighting
  use { 'uiiaoo/java-syntax.vim',
    ft = { 'java' } }

  -- custom statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons',
    opt = true }
  }

  -- show signature while typing
  use { 'ray-x/lsp_signature.nvim' }

  -- preview for markdown filetypes
  use { "iamcco/markdown-preview.nvim",
    ft = { 'md' },
    run = "cd app && npm install" }

  -- latex asynchronous pdf rendering
  use { 'donRaphaco/neotex',
    ft = { 'tex' } }

  -- fileexplorer on the side
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  -- nim language support
  use { 'zah/nim.vim',
    ft = { 'nim' } }

  -- automatic closing of brackets
  use { 'windwp/nvim-autopairs' }

  -- autocompletion and its sources
  use { 'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'lukas-reineke/cmp-under-comparator',
      'antoinemadec/fixcursorhold.nvim',
      'l3mon4d3/luasnip',
      'saadparwaiz1/cmp_luasnip',
      'neovim/nvim-lspconfig',
      'onsails/lspkind-nvim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'LostNeophyte/null-ls-embedded',
      'nvim-lua/plenary.nvim',
      'jay-babu/mason-null-ls.nvim' } }

  -- showing color of hex values, etc
  use { 'norcalli/nvim-colorizer.lua' }

  -- show tags
  use {
    "SmiteshP/nvim-navbuddy",
    requires = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    }
  }

  -- better language highlighting by improved parsing
  use { 'nvim-treesitter/nvim-treesitter' }

  -- automatically close html-tags
  use { 'windwp/nvim-ts-autotag',
    requires = { 'nvim-treesitter/nvim-treesitter' } }

  -- colorful brackets
  use { 'luochen1990/rainbow' }

  -- todo symbols and highlighting
  use { 'folke/todo-comments.nvim',
    requires = { 'nvim-lua/plenary.nvim' } }

  -- git wrapper
  use { 'tpope/vim-fugitive' }

  -- golang language support
  use { 'fatih/vim-go',
    ft = { 'go' } }

  -- markdown language support
  use { 'preservim/vim-markdown',
    ft = { 'md' },
    requires = { 'godlygeek/tabular' } }

  -- bulk renamer
  use { 'qpkorr/vim-renamer' }

  -- additional quote/parantheses funtions
  use { 'tpope/vim-surround' }

  -- colorscheme
  use { 'tiyn/vim-tccs' }

  -- package manager sync (last entry)
  if packer_bootstrap then
    require('packer').sync()
  end
end)
