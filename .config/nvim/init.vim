let mapleader =","

""" Begin Plugin section
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter' " git upgrades
Plug 'alvan/vim-closetag' " auto close HTML tags
Plug 'donRaphaco/neotex' , {'for': 'tex'} " asynchronous pdf rendering for pdf
Plug 'fatih/vim-go' , {'for': 'go'} " better support for golang
Plug 'hrsh7th/cmp-buffer' " autocompletion bridge for buffer
Plug 'hrsh7th/cmp-path' " autocompletion bridge for filesystem
Plug 'hrsh7th/nvim-cmp' " autocompletion
Plug 'hrsh7th/cmp-nvim-lsp' " autocompletion bridge to lsp
Plug 'itchyny/lightline.vim' " fancy statusline
Plug 'junegunn/fzf.vim' " quickly jump files using fzf
Plug 'l3mon4d3/luasnip' " snippet support
Plug 'luochen1990/rainbow' " colorized matching brackets
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'} " show tags
Plug 'mattesgroeger/vim-bookmarks' " Set bookmarks
Plug 'neovim/nvim-lspconfig' " Language server client
Plug 'onsails/lspkind-nvim' " icons on completion
Plug 'qpkorr/vim-renamer' " bulk renamer
Plug 'raimondi/delimitmate' " automatic closing of brackets
Plug 'rrethy/vim-hexokinase' , {'do': 'make hexokinase'} " color Preview
Plug 'ryanoasis/vim-devicons' " enable icons for vim
Plug 'saadparwaiz1/cmp_luasnip' " add snippets from luasnips to cmp
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " filetree
Plug 'tiyn/vim-tccs' " custom colorscheme
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-surround' " help for quotes/parantheses
Plug 'uiiaoo/java-syntax.vim' , {'for': 'java'} " better syntax highlight for java than default
Plug 'zah/nim.vim' , {'for': 'nim'} " highlighting for nim
call plug#end()

" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" donRaphaco/neotex
let g:neotex_enabled = 2

" fatih/vim-go
let g:go_def_mapping_enabled = 0

" itchyny/lightline.vim
let g:lightline = { 'colorscheme': 'tccs'}

" junegunn/fzf.vim
let $FZF_DEFAULT_COMMAND = 'find . ~ -type f'
nmap <F4> :FZF<CR>

" luochen1990/rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\	}
\}

" majutsushi/tagbar
map <F3> :TagbarToggle<CR>

" mattesgroeger/vim-bookmarks
let g:bookmark_no_default_key_mappings = 1
nmap mm <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ms <Plug>BookmarkShowAll
nmap mn <Plug>BookmarkNext
nmap mp <Plug>BookmarkPrev
nmap mc <Plug>BookmarkClear
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = 'B'
let g:bookmark_highlight_lines = 1

" hrsh7th/nvim-cmp
lua << EOF
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
      	cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
      	luasnip.jump(-1)
      else
      	fallback()
      end
    end, { "i", "s" }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
      	cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
      	luasnip.expand_or_jump()
      else
      	fallback()
      end
    end, { "i", "s" }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
  }},
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'luasnip' },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      preset = "codicons",
      maxwidth = 50,
      menu = {
      	nvim_lsp = "[LSP]",
      	path = "[PATH]",
        buffer = "[BUF]",
      	luasnip = "[SNIP]",
      },
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },
    }),
  },
}

require("luasnip.loaders.from_snipmate").lazy_load()
EOF

" neovim/nvim-lspconfig
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<F5>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "bashls", "tsserver", "texlab", "ccls", "gopls", "hls", "nimls", "marksman" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach=on_attach,
        capabilities=capabilities,
        flags = {
            debounce_text_changes = 150
            }
        }
end


require'lspconfig'.jdtls.setup{
    on_attach=on_attach,
    flags = {
        debounce_text_changes = 150
        },
    cmd = { 'jdtls' }
    }

EOF

" rrethy/vim-hexokinase
let g:Hexokinase_refreshEvents = ['InsertLeave']
let g:Hexokinase_optInPatterns = [
            \   'full_hex',
            \   'triple_hex',
            \   'rgb',
            \   'rgba',
            \   'hsl',
            \   'hsla',
            \   'color_names'
            \]

let g:Hexokinase_highlighters = ['backgroundfull']
autocmd VimEnter * HexokinaseTurnOn

" scrooloose/nerdtree
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "left"

" tpope/vim-fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gu :diffget //2<CR>
nnoremap <leader>gs :G<CR>

""" end plugin section

set go=a
set noshowmode

" enable mouse for all modes
set mouse=a
set clipboard+=unnamedplus

" setting Tab-length
set expandtab
set softtabstop=4
set shiftwidth=4

" splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" disable case sensitive matching
set ignorecase

" enable nocompatible mode
set nocompatible

" enable Plugins
filetype plugin on

" enable syntax highlighting
syntax on

" enable true colors
set termguicolors

" set utf-8 encoding
set encoding=utf-8

" show relative numbers on left side
set number relativenumber

" speedup vim with long lines
set ttyfast
set lazyredraw

" textEdit might fail without hidden
set hidden

" disable Backupfiles for Lsp
set nobackup
set nowritebackup

" always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" enable persistent undo
if has('persistent_undo')
    set undofile
    set undodir=$XDG_CACHE_HOME/vim/undo
endif

" unmap unwanted commands
nnoremap <F1> <NOP>
nnoremap <F9> <NOP>
nnoremap <F10> <NOP>
nnoremap <F11> <NOP>
nnoremap <F12> <NOP>

inoremap <F2> <NOP>
inoremap <F3> <NOP>
inoremap <F4> <NOP>
inoremap <F5> <NOP>
inoremap <F6> <NOP>
inoremap <F7> <NOP>
inoremap <F8> <NOP>
inoremap <F9> <NOP>
inoremap <F10> <NOP>
inoremap <F11> <NOP>
inoremap <F12> <NOP>

" mapping Dictionaries
nnoremap <F6> :setlocal spell! spelllang=de_de<CR>
nnoremap <F7> :setlocal spell! spelllang=en_us<CR>

" compiler for languages
nnoremap <leader>c :w! \| !compiler <c-r>%<CR>

" open corresponding file (pdf/html/...)
nnoremap <leader>p :!opout <c-r>%<CR><CR>

" shortcut for split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" alias for replacing
nnoremap <leader>ss :%s//gI<Left><Left><Left>

" delete trailing whitespaces on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" read files correctly
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.html set filetype=html
autocmd BufRead,BufNewFile *.h set filetype=c
autocmd BufRead,BufNewFile *.nim set filetype=nim

" formatting options
autocmd FileType java setlocal shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2

" formatting programs
autocmd FileType c setlocal formatprg=astyle\ --mode=c\ --style=ansi
autocmd FileType c noremap <F8> gggqG
autocmd FileType html noremap <F8> :silent %!tidy -q -i --show-errors 0 <CR>
autocmd FileType java setlocal formatprg=astyle\ --indent=spaces=2\ --style=google
autocmd FileType java noremap <F8> gggqG
autocmd FileType markdown noremap <F8> :silent %!prettier --stdin-filepath % <CR>
autocmd FileType nim noremap <F8> :silent !nimpretty %<CR>
autocmd FileType python setlocal formatprg=autopep8\ -
autocmd FileType python noremap <F8> gggqG
autocmd FileType tex,latex setlocal formatprg=latexindent\ -
autocmd FileType tex,latex noremap <F8> gggqG

" cleanup certain files after leaving the editor
autocmd VimLeave *.tex !texclear %
autocmd VimLeave *.c !cclear

" highlighting break line
autocmd BufEnter,FileType c set colorcolumn=80
autocmd BufEnter,FileType java set colorcolumn=100
autocmd BufEnter,FileType markdown set colorcolumn=80
autocmd BufEnter,FileType tex set colorcolumn=80
autocmd BufEnter,FileType nim set colorcolumn=80
autocmd BufEnter,FileType python set colorcolumn=80

"" colorscheme
set background=dark
colorscheme tccs
highlight colorcolumn guibg=#772222

" python
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

" irc compatibility to interactive
nnoremap <leader>is :.w >> in<cr>dd
