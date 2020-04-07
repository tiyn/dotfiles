let mapleader =","
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus

" Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" Enable autocompletion:
set wildmode=longest,list,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Setting Tab-length
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Clean LaTex build files
autocmd VimLeave *.tex !texclear %

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Mapping Dictionaries
map <F5> :setlocal spell! spelllang=de<CR>
map <F6> :set spelllang=en_us<CR>

" Read files correctly
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Compiler for languages
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding file (pdf/html/...)
map <leader>p :!opout <c-r>%<CR><CR>

" Delete trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Shortcut for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Plugin section
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lervag/vimtex' , { 'for' : 'tex'} " Tex library for coc autocompletion
Plug 'donRaphaco/neotex', { 'for': 'tex'} " Asynchronous pdf rendering
Plug 'scrooloose/nerdtree' " Filetree
Plug 'majutsushi/tagbar' " Show tags
Plug 'airblade/vim-gitgutter' " Git Upgrades
Plug 'FredKSchott/CoVim' "Use vim together
Plug 'qpkorr/vim-renamer' " Bulk renamer
Plug 'sirver/ultisnips' " Snippets
call plug#end()

" Colorscheme
source /home/tiynger/.config/nvim/codedark.vim

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
