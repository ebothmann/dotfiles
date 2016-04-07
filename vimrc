if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set ignorecase
set smartcase
set incsearch
set gdefault
set hlsearch

set laststatus=2
set ruler 
set wildmenu
if exists('+colorcolumn')
    set colorcolumn=79
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:+
endif

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Break undo sequence before deleting with CTRL-U
inoremap <C-U> <C-G>u<C-U>

" load local vim files securely
set exrc
set secure

call plug#begin('~/.vim-plug')
Plug 'vim-scripts/ReplaceWithRegister'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'
Plug 'lervag/vimtex'
Plug 'derekwyatt/vim-fswitch'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set background=dark
" colorscheme PaperColor
colorscheme base16-harmonic16

set langmap=ö[,ä],Ö{,Ä}
nnoremap ü <C-]>

" use Ctrl-hjkl to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" customise vimtex-Skim
let g:vimtex_view_general_viewer
    \ = '/Users/eno/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
let g:tex_flavor = 'latex'

" toggle header/implementation file
nmap <silent> <Leader>t :FSHere<cr>

" vim:set ft=vim expandtab shiftwidth=2:
