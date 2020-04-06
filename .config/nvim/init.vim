let mapleader =","
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

"set bg=light
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

" Plugin section
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete
Plug 'lervag/vimtex' , { 'for' : 'tex'} " tex library for coc autocompletion
Plug 'donRaphaco/neotex', { 'for': 'tex'} " Asynchronous pdf rendering
Plug 'preservim/nerdtree' " Filetree
Plug 'majutsushi/tagbar' " Show tags
Plug 'airblade/vim-gitgutter' " Git Upgrades
Plug 'FredKSchott/CoVim' "Use vim together
Plug 'qpkorr/vim-renamer' " Bulk renamer
call plug#end()

" Coc extensions
let g:coc_global_extensions = ['coc-snippets', 'coc-vimtex']
" tab through suggestions
let g:coc_snippet_next = '<tab>'
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
" jump to next placeholder
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" ending suggestions
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction
" expand snippets on enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

"tagbar
map <F3> :TagbarToggle<CR>

"nerdtree
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "left"

"neotex
let g:neotex_enabled = 2

" CoVim
let CoVim_default_name = "TiynGER"
let CoVim_default_port = "7000"
