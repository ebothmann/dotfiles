" Enrico Bothmann's vim runtime configuration file.
"
" To use it on Unix, copy/link it to
"
"   ~/.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


""""""""""""""""""""" settings """""""""""""""""""""""""""""""""""""""""""""""

" general
if exists('+undofile')
    set undofile                " enable persistent undo
endif
if has('mouse')                 " enable mouse
    set mouse=a
endif
set encoding=utf-8
set exrc                        " load local vim files ...
set secure                      " ... securely

" visuals
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmatch                   " show matching brackets
set number
if exists("+relativenumber")
    set relativenumber          " enable relative line numbers
endif
if exists('+colorcolumn')
    set colorcolumn=79
endif
set list                        " show invisibles (tabs, line endings etc.)
set listchars=tab:▸\ ,trail:·   " choose symbols to show invisibles
set laststatus=2

" editing
set backspace=indent,eol,start  " allow backspacing everything in insert mode

" search and replace
set ignorecase                  " ignore case, but only if ...
set smartcase                   " ... the search string is all lower-case
set incsearch                   " jump to next match during search
set gdefault                    " substitute all occurrences in a line per default

" coloring (if colors available)
if &t_Co > 2 || has("gui_running")
  syntax on                     " enable syntax highlighting
  set hlsearch                  " enable last search pattern highlighting
endif

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


""""""""""""""""""""" auto-commands """"""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  " enable file type detection and settings
  filetype plugin indent on

  " define customisations within an autocmd group
  augroup myvimrc

  " remove commands of this group (if vimrc is sourced more than once)
  au!

  " hard wrap after 78 characters
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " save on losing focus
  autocmd FocusLost * :wa

  augroup END
else
  " at least enable auto-indenting otherwise
  set autoindent
endif

" set our tex format used most
let g:tex_flavor = "latex"


""""""""""""""""""""" command definitions """"""""""""""""""""""""""""""""""""

" see the difference between the current buffer and its file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif


""""""""""""""""""""" mappings """""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"
let maplocalleader = ","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" disable highlighting
nnoremap <leader>h :noh<cr>

" navigate through soft lines instead of hard lines
nnoremap j gj
nnoremap k gk

" use Python-like regex
nnoremap / /\v
vnoremap / /\v

" Make use of german special keys in normal mode
map ü <C-]>
set langmap=ö[,ä],Ö{,Ä}

" use jj to get back to normal mode
inoremap jj <ESC>

" use Ctrl-hjkl to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" open file with CtrlP plug-in
nnoremap <Leader>o :CtrlP<CR>

" write/quit file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>wqa :wqa<CR>

" manual YouCompleteMe loading
nnoremap <leader>ycm :call EnableYCM()<cr>
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" toggle header/implementation file
nmap <silent> <Leader>t :FSHere<cr>

""""""""""""""""""""" plugins """"""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim-plug')

" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'michaeljsmith/vim-indent-object'

" navigating/interacting
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-system-copy'

" styling
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" language support
Plug 'klen/python-mode'
Plug 'lervag/vimtex'
Plug 'valloric/youcompleteme', { 'for': ['c', 'cpp', 'sh', 'python', 'vim'],
            \ 'do': './install.py --clang-completer'}
autocmd! User YouCompleteMe if !has('vim_starting') |
            \ call youcompleteme#Enable() | endif

call plug#end()

" turn off py-mode completion, because we use YouCompleteMe instead
let g:pymode_rope_completion = 0

" white-list some ycm extra configuration files
let g:ycm_extra_conf_globlist = ['~/Projekte/scratch/sherpa/*']

let g:ycm_autoclose_preview_window_after_insertion = 1

" make youcompleteme work with vimtex
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*'
      \ ]

" manual YouCompleteMe loading
function! EnableYCM()
    call plug#load('YouCompleteMe')
    call youcompleteme#Enable()
endfunction

" set up vimtex-Skim sync
let g:vimtex_view_general_viewer
            \ = '/Users/eno/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'

" comment as '/* ... */' instead of '/*...*/'
let NERDSpaceDelims=1

" color scheme
if &t_Co >= 256 || has("gui_running")
  set background=light
  colorscheme PaperColor
  let g:airline_theme='PaperColor'
endif

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'
