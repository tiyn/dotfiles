let mapleader =","

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

" delete trailing whitespaces on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" clean LaTex build files
autocmd VimLeave *.tex !texclear %

" mapping Dictionaries
map <F6> :setlocal spell! spelllang=de_de<CR>
map <F7> :set spelllang=en_us<CR>

" compiler for languages
map <leader>c :w! \| !compiler <c-r>%<CR>

" open corresponding file (pdf/html/...)
map <leader>p :!opout <c-r>%<CR><CR>

" shortcut for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
map <C-p> "+P
vnoremap <C-c> "+y

" save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" alias for replacing
nnoremap S :%s//gI<Left><Left><Left>

" read files correctly
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.h set filetype=c

" formatting
au FileType python setlocal formatprg=autopep8\ -
au FileType java setlocal formatprg=astyle\ --indent=spaces=2\ --style=google
autocmd FileType java setlocal shiftwidth=2 softtabstop=2
au FileType c setlocal formatprg=astyle\ --mode=c
au FileType tex,latex setlocal formatprg=latexindent\ -
autocmd FileType java,python,c,tex,latex noremap <F8> gggqG
au FileType markdown noremap <F8> :silent %!prettier --stdin-filepath % <CR>


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
Plug 'donRaphaco/neotex' , {'for': 'tex'} " asynchronous pdf rendering
Plug 'frazrepo/vim-rainbow' " colorized matching brackets
Plug 'junegunn/fzf.vim' " quickly jump files using fzf
Plug 'lervag/vimtex' , {'for' : 'tex'} " tex library for autocompletion
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'} " show tags
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " autocompletion
Plug 'qpkorr/vim-renamer' " bulk renamer
Plug 'raimondi/delimitmate' " automatic closing of brackets
Plug 'rrethy/vim-hexokinase' , {'do': 'make hexokinase'} " color Preview
Plug 'ryanoasis/vim-devicons' " enable icons for vim
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " filetree
Plug 'sirver/ultisnips' " snippets
Plug 'tomasiser/vim-code-dark' " adding colorscheme
Plug 'tpope/vim-surround' " help for quotes/parantheses
Plug 'uiiaoo/java-syntax.vim' , {'for': 'java'} " better syntax highlight for java than default
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

" frazrepo/vim-rainbow
au FileType,BufNewFile,BufRead java,c,cpp,py,h call rainbow#load()

" majutsushi/tagbar
map <F3> :TagbarToggle<CR>

" neoclide/coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = [
    \ 'coc-java',
    \ 'coc-markdownlint',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-vimtex',
    \ ]

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <F5> <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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

" sirver/ultisnips
let g:UltiSnipsExpandTrigger="<alt-j>"

" tomasiser/vim-code-dark
colorscheme codedark

""" end plugin section
