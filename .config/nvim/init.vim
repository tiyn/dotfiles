" Begin Plugin section
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex' , { 'for' : 'tex'} " Tex library for autocompletion
Plug 'donRaphaco/neotex', { 'for': 'tex'} " Asynchronous pdf rendering
Plug 'scrooloose/nerdtree' " Filetree
Plug 'majutsushi/tagbar' " Show tags
Plug 'airblade/vim-gitgutter' " Git Upgrades
"Plug 'FredKSchott/CoVim' "Use vim together
Plug 'qpkorr/vim-renamer' " Bulk renamer
Plug 'sirver/ultisnips' " Snippets
Plug 'uiiaoo/java-syntax.vim' , { 'for': 'java'} " Better syntax highlight for java than default
Plug 'frazrepo/vim-rainbow' " Colorized matching brackets
Plug 'junegunn/fzf.vim' " Quickly jump files using fzf
Plug 'ryanoasis/vim-devicons' " Enable Icons for vim
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Color Preview
Plug 'tomasiser/vim-code-dark' " adding colorscheme
call plug#end()

" Rainbow
au FileType java,c,cpp,py,h call rainbow#load()

" You complete me
let g:ycm_global_ycm_extra_conf = '/home/tiynger/.config/nvim/ycm_extra_conf.py'
let g:ycm_semantic_triggers = {
	\ 'tex' : ['{']
	\}
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Tagbar
map <F3> :TagbarToggle<CR>

" Nerdtree
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "left"

" Neotex
let g:neotex_enabled = 2

" CoVim
let CoVim_default_name = "TiynGER"
let CoVim_default_port = "7000"

" Hexokinase
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

" End Plugin section

" Start Formatting section

autocmd FileType java,python noremap <F8> gggqG

au FileType python setlocal formatprg=autopep8\ -

au FileType java setlocal formatprg=google-java-format\ -

" End Formatting section

let mapleader =","

set go=a
" Enable mouse for all modes
set mouse=a
set clipboard+=unnamedplus
" Enable command completion
set wildmode=longest,list,full
" Setting Tab-length
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright
" Disable case sensitive matching
set ignorecase
" Enable nocompatible mode
set nocompatible
" Enable Plugins
filetype plugin on
" Enable syntax highlighting
syntax on
" Enable true colors
set termguicolors
" Set utf-8 encoding
set encoding=utf-8
" Show relative numbers on left side
set number relativenumber
" Speedup vim with long lines
set ttyfast
set lazyredraw

" enable persistent undo
if has('persistent_undo')
    set undofile
    set undodir=$XDG_CACHE_HOME/vim/undo
endif

" Colorscheme
colorscheme codedark
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#1b1b1b
highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#1b1b1b

" Center screen on Insertion
autocmd InsertEnter * norm zz
" Delete trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Clean LaTex build files
autocmd VimLeave *.tex !texclear %
" Read files correctly
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Mapping Dictionaries
map <F5> :setlocal spell! spelllang=de_de<CR>
map <F6> :set spelllang=en_us<CR>
" Compiler for languages
map <leader>c :w! \| !compiler <c-r>%<CR>
" Open corresponding file (pdf/html/...)
map <leader>p :!opout <c-r>%<CR><CR>
" Shortcut for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
map <C-p> "+P
vnoremap <C-c> "+y
" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" Alias for replacing
nnoremap S :%s//gI<Left><Left><Left>
