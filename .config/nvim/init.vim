" Begin Plugin section
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Read files correctly
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.h set filetype=c

call plug#begin('~/.local/share/nvim/plugged')
Plug 'raimondi/delimitmate' " Automatic closing of brackets
Plug 'lervag/vimtex' , {'for' : 'tex'} " Tex library for autocompletion
Plug 'donRaphaco/neotex' , {'for': 'tex'} " Asynchronous pdf rendering
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " Filetree
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'} " Show tags
Plug 'airblade/vim-gitgutter' " Git Upgrades
Plug 'qpkorr/vim-renamer' " Bulk renamer
Plug 'sirver/ultisnips' " Snippets
Plug 'uiiaoo/java-syntax.vim' , {'for': 'java'} " Better syntax highlight for java than default
Plug 'frazrepo/vim-rainbow' " Colorized matching brackets
Plug 'junegunn/fzf.vim' " Quickly jump files using fzf
Plug 'ryanoasis/vim-devicons' " Enable Icons for vim
Plug 'rrethy/vim-hexokinase' , {'do': 'make hexokinase'} " Color Preview
Plug 'tomasiser/vim-code-dark' " adding colorscheme
Plug 'tpope/vim-surround' " Help for quotes/parantheses
Plug 'alvan/vim-closetag' " Auto close HTML tags
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" Coc
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

" Colorscheme
colorscheme codedark

" Rainbow
au FileType,BufNewFile,BufRead java,c,cpp,py,h call rainbow#load()

" Ultisnippets
let g:UltiSnipsExpandTrigger="<alt-j>"

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

" Vim-Closetag
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

" End Plugin section

let mapleader =","

set go=a
" Enable mouse for all modes
set mouse=a
set clipboard+=unnamedplus
" Enable command completion
set wildmode=longest,list,full
" Setting Tab-length
set expandtab
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
" TextEdit might fail without hidden
set hidden
" Disable Backupfiles for Lsp
set nobackup
set nowritebackup
" Dont pass messages to ins-completion-menu
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
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

" Delete trailing whitespaces on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Clean LaTex build files
autocmd VimLeave *.tex !texclear %

" Mapping Dictionaries
map <F6> :setlocal spell! spelllang=de_de<CR>
map <F7> :set spelllang=en_us<CR>
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

" Start Formatting section

au FileType python setlocal formatprg=autopep8\ -

au FileType java setlocal formatprg=astyle\ --indent=spaces=2\ --style=google

autocmd FileType java setlocal shiftwidth=2 softtabstop=2

au FileType c setlocal formatprg=astyle\ --mode=c

au FileType tex,latex setlocal formatprg=latexindent\ -

autocmd FileType java,python,c,tex,latex noremap <F8> gggqG

au FileType markdown noremap <F8> :silent %!prettier --stdin-filepath % <CR>

" End Formatting section

