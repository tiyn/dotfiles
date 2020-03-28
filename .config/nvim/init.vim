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

""" Shortcuts
" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

"" LATEX
" Clean LaTex build files
autocmd VimLeave *.tex !texclear %
autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section*{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection*{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection*{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i

"""HTML
autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
autocmd FileType html inoremap &<space> &amp;<space>
autocmd FileType html inoremap ä &auml;
autocmd FileType html inoremap ë &euml;
autocmd FileType html inoremap ï &iuml;
autocmd FileType html inoremap ö &ouml;
autocmd FileType html inoremap ü &uuml;

" Compiler for languages
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding file (pdf/html/...)
map <leader>p :!opout <c-r>%<CR><CR>

" Delete trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Plugin section
call plug#begin('~/.config/nvim/plugged')
" Autocorrect
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Latex Upgrades
Plug 'donRaphaco/neotex', { 'for': 'tex'}
Plug 'lervag/vimtex', {'for': 'tex'}
" Java Upgrades
Plug 'artur-shaik/vim-javacomplete2'
" Indexing and Overview tools
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
" Git Upgrades
Plug 'airblade/vim-gitgutter'
" Use Vim together
Plug 'FredKSchott/CoVim'
" Bulk Renamer
Plug 'qpkorr/vim-renamer'
" Python3 Upgrades
Plug 'zchee/deoplete-jedi'
call plug#end()
"tagbar
map <F3> :TagbarToggle<CR>
let g:tagbar_left = 1
"nerdtree
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "right"
"neotex
let g:neotex_enabled = 2
"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources.java = ['jc', 'javacomplete2', 'file', 'buffer']
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'tex': g:vimtex#re#deoplete
	\})
""tab as remapping for deoplete
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
" CoVim
let CoVim_default_name = "TiynGER"
let CoVim_default_port = "7000"
