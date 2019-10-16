let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

set bg=light
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
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" Read files correctly
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Compiler for languages
map <leader>c :w! \| !compiler <c-r>%<CR>

" Clean LaTex build files
autocmd VimLeave *.tex !texclear %

" Delete trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Plugin section
call plug#begin('~/.config/nvim/plugged')
Plug 'donRaphaco/neotex', { 'for': 'tex'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'artur-shaik/vim-javacomplete2'
call plug#end()
let g:neotex_enabled = 2
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources.java = ['jc', 'javacomplete2', 'file', 'buffer']
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'tex': g:vimtex#re#deoplete
	\})
"tab as remapping for deoplete
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction "" }}}
" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
