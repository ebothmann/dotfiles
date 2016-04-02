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

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler 
set wildmenu

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

call plug#begin('~/.vim-plug')
Plug 'NLKNguyen/papercolor-theme'
Plug 'lervag/vimtex'
call plug#end()

set background=light
colorscheme PaperColor

set langmap=ö[,ä],Ö{,Ä}
nnoremap ü <C-]>

" use Ctrl-hjkl to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" set up vimtex-Skim sync
let g:vimtex_view_general_viewer
    \ = '/Users/eno/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'

" vim:set ft=vim expandtab shiftwidth=2:
