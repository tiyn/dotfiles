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
Plug 'alaviss/nim.nvim' , {'for': 'nim'} " Highlighting for nim
Plug 'alvan/vim-closetag' " auto close HTML tags
Plug 'donRaphaco/neotex' , {'for': 'tex'} " asynchronous pdf rendering
Plug 'frazrepo/vim-rainbow' " colorized matching brackets
Plug 'junegunn/fzf.vim' " quickly jump files using fzf
Plug 'lervag/vimtex' , {'for' : 'tex'} " tex library for autocompletion
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'} " show tags
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " autocompletion
Plug 'qpkorr/vim-renamer' " bulk renamer
Plug 'raimondi/delimitmate' " automatic closing of brackets
"Plug 'rakr/vim-one' " adding colorscheme
Plug 'rrethy/vim-hexokinase' , {'do': 'make hexokinase'} " color Preview
Plug 'ryanoasis/vim-devicons' " enable icons for vim
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " filetree
Plug 'sirver/ultisnips' " snippets
Plug 'tomasiser/vim-code-dark' " adding colorscheme
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-surround' " help for quotes/parantheses
Plug 'uiiaoo/java-syntax.vim' , {'for': 'java'} " better syntax highlight for java than default
Plug 'whonore/coqtail' , {'for': 'v'} " coq interactive proof
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

" junegunn/fzf.vim
let $FZF_DEFAULT_COMMAND = 'find . ~ -type f'
nmap <F4> :FZF<CR>

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

" tpope/vim-fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gu :diffget //2<CR>
nnoremap <leader>gs :G<CR>

" whonore/coqtail
function g:CoqtailHighlight()
	hi def CoqtailChecked guifg=#44FF44
	hi def CoqtailSent guifg=#777777
endfunction

""" end plugin section

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
autocmd BufEnter,FileType python set colorcolumn=80

" colorscheme
set background=dark
colorscheme codedark
highlight colorcolumn guibg=#772222
