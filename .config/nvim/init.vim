let mapleader = ","

" begin plugin section
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'qpkorr/vim-renamer'
Plug 'tomasiser/vim-code-dark'
call plug#end()
" end plugin section

set go=a

" enable mouse for all modes
set mouse=a
set clipboard+=unnamedplus

" enable command completion
set wildmode=longest,list,full

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

" dont pass messages to ins-completion-menu
set shortmess+=c

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
nnoremap <F2> <NOP>
nnoremap <F3> <NOP>
nnoremap <F4> <NOP>
nnoremap <F5> <NOP>
nnoremap <F8> <NOP>
nnoremap <F9> <NOP>
nnoremap <F10> <NOP>
nnoremap <F11> <NOP>
nnoremap <F12> <NOP>

inoremap <F1> <NOP>
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
autocmd BufRead,BufNewFile *.h set filetype=c

" formatting
autocmd FileType c setlocal formatprg=astyle\ --mode=c
autocmd FileType java setlocal formatprg=astyle\ --indent=spaces=2\ --style=google
autocmd FileType java setlocal shiftwidth=2 softtabstop=2
autocmd FileType markdown noremap <F8> :silent %!prettier --stdin-filepath % <CR>
autocmd FileType python setlocal formatprg=autopep8\ -
autocmd FileType tex,latex setlocal formatprg=latexindent\ -
autocmd FileType c,java,python,tex,latex noremap <F8> gggqG

" cleanup certain files after leaving the editor
autocmd VimLeave *.tex !texclear %
autocmd VimLeave *.c !cclear

" highlighting break line
autocmd BufEnter,FileType c set colorcolumn=80
autocmd BufEnter,FileType java set colorcolumn=100
autocmd BufEnter,FileType markdown set colorcolumn=80

" colorscheme
colorscheme codedark
highlight colorcolumn guibg=#772222
