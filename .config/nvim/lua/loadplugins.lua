-- loadplugins

-- load plugins with packer
return require("packer").startup(function(use)
    -- automatic closing of brackets
    use 'raimondi/delimitmate'

    -- improved java syntax highlighting
    use {'uiiaoo/java-syntax.vim',
        ft = {'java'}}

    -- custom statusline
    use {'itchyny/lightline.vim',
        require = {"tiyn/vim-tccs"}}

    -- latex asynchronous pdf rendering
    use {'donRaphaco/neotex',
        ft = {'tex'}}

    -- navigating folders with a file tree
    use {'scrooloose/nerdtree',
        cmd = 'NERDTreeToggle',
        requires = 'ryanoasis/vim-devicons'}

    -- nim language support
    use {'zah/nim.vim', ft = {'nim'}}

    -- autocompletion and its sources
    use {'hrsh7th/nvim-cmp',
        requires = {'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'l3mon4d3/luasnip',
            'saadparwaiz1/cmp_luasnip',
            'neovim/nvim-lspconfig',
            'onsails/lspkind-nvim'}}

    -- showing color of hex values, etc
    use 'norcalli/nvim-colorizer.lua'

    -- package manager
    use 'wbthomason/packer.nvim'

    -- colorful brackets
    use 'luochen1990/rainbow'

    -- show tags
    use {'majutsushi/tagbar',
        cmd = 'TagbarToggle'}

    -- git wrapper
    use 'tpope/vim-fugitive'

    -- indicate git diff status of line
    use 'airblade/vim-gitgutter'

    -- golang language support
    use {'fatih/vim-go',
        ft = {'go'}}

    -- markdown language support
    use {'preservim/vim-markdown',
        ft = {'md'},
        requires = {'godlygeek/tabular'}}

    -- bulk renamer
    use 'qpkorr/vim-renamer'

    -- additional quote/parantheses funtions
    use 'tpope/vim-surround'

    -- colorscheme
    use 'tiyn/vim-tccs'

end)
