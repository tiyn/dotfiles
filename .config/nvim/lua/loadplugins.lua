-- loadplugins

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


return require("lazy").setup({
  -- indicate git diff status of line
  'lewis6991/gitsigns.nvim',

  -- show indentation lines (in empty lines too)
  'lukas-reineke/indent-blankline.nvim',

  -- improved java syntax highlighting
  {
    'uiiaoo/java-syntax.vim',
    ft = { 'java' },
  },

  -- custom statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', }
  },

  -- show signature while typing
  'ray-x/lsp_signature.nvim',

  -- preview for markdown filetypes
  {
    "iamcco/markdown-preview.nvim",
    ft = { 'markdown' },
    build = "cd app && yarn install",
  },

  -- latex asynchronous pdf rendering
  {
    'donRaphaco/neotex',
    ft = { 'tex' },
  },

  -- nim language support
  {
    'zah/nim.vim',
    ft = { 'nim' },
  },

  -- automatic closing of brackets
  'windwp/nvim-autopairs',

  -- autocompletion and its sources
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-buffer',
      -- standalone cmp sources
      'hrsh7th/cmp-path',
      'lukas-reineke/cmp-under-comparator',
      -- lsp cmp source
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
      -- luasnip cmp source
      'l3mon4d3/luasnip',
      'saadparwaiz1/cmp_luasnip',
      -- lang server management
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'LostNeophyte/null-ls-embedded',
      'jay-babu/mason-null-ls.nvim',
      -- dependencies
      'nvim-lua/plenary.nvim',
    },
  },

  -- fix for cursorhold function
  'antoinemadec/fixcursorhold.nvim',

  -- showing color of hex values, etc
  'norcalli/nvim-colorizer.lua',

  -- show tags
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
  },

  -- fileexplorer on the side
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- better language highlighting by improved parsing
  'nvim-treesitter/nvim-treesitter',

  -- automatically close html-tags
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  -- folding improvements
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
  },

  -- colorful brackets
  'luochen1990/rainbow',

  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- clean up white spaces and empty lines before writing
  "mcauley-penney/tidy.nvim",

  -- todo symbols and highlighting
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- git wrapper
  'tpope/vim-fugitive',

  -- golang language support
  {
    'fatih/vim-go',
    ft = { 'go' },
  },

  -- markdown language support
  {
    'preservim/vim-markdown',
    ft = { 'markdown' },
    dependencies = { 'godlygeek/tabular' },
  },

  -- bulk renamer
  'qpkorr/vim-renamer',

  -- additional quote/parantheses funtions
  'tpope/vim-surround',

  -- colorscheme
  'tiyn/vim-tccs',
})
