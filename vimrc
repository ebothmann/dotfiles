" vim runtime configuration file
" to use it on Unix, copy/link it to ~/.vimrc

" When started as evim, evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" =================== settings ===============================================

" general
if exists('+undofile')
  set undofile                  " enable persistent undo
  set undodir=~/.vim/undofiles  " store undo files centrally
endif
if has('mouse')
  set mouse=a                   " enable mouse
endif
set encoding=utf-8
set wildmenu                    " enable autocomplete menu as in zsh
set wildmode=longest,full
set hidden                      " switch between buffers w/o having to save
set splitbelow
set splitright

" visuals
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set laststatus=2                " always show status bar
set number
if exists("+relativenumber")
  set relativenumber            " enable relative line numbers
endif
set list                        " show non-printable characters
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

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
set shiftwidth=4                " >> indents by 4 spaces
set softtabstop=4               " tab key indents by 4 spaces
set expandtab                   " use spaces instead of tabs
set shiftround                  " >> indents to next multiple of 'shiftwidth'


" =================== auto-commands ==========================================

if has("autocmd")
  " enable file type detection and settings
  filetype plugin indent on

  " enable improved % command
  runtime macros/matchit.vim

  " define customisations within an autocmd group
  augroup myvimrc

    " remove commands of this group (if vimrc is sourced more than once)
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  augroup END
else
  " at least enable auto-indenting otherwise
  set autoindent
endif

" set our tex format used most
let g:tex_flavor = "latex"


" =================== command definitions ====================================

" see the difference between the current buffer and its file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


" =================== mappings ===============================================

" use space and alt-space as leaders
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vs :so $MYVIMRC<CR>

" disable highlighting
nnoremap <leader>h :noh<cr>

" Make use of german special keys in normal mode
set langmap=ö[,ä],Ö{,Ä}
nnoremap ü <C-]>
nmap ö [
nmap ä ]
omap ö [
omap ä ]
xmap ö [
xmap ä ]
nmap Ö {
nmap Ä }
omap Ö {
omap Ä }
xmap Ö {
xmap Ä }

" use Ctrl-hjkl to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" open file with CtrlP plug-in
nnoremap <Leader>o :CtrlP<CR>

" manual YouCompleteMe loading
" nnoremap <leader>ycm :call EnableYCM()<cr>
" nnoremap <leader>jd :YcmCompleter GoTo<CR>

" toggle header/implementation file
nmap <silent> <Leader>t :FSHere<cr>

" expand %% to the directory of the current buffer
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" =================== plugins ================================================

call plug#begin('~/.vim-plug')

" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'michaeljsmith/vim-indent-object'

" navigating/interacting
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'tpope/vim-unimpaired'
" Plug 'rking/ag.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'christoomey/vim-system-copy'
Plug 'juneedahamed/vc.vim'

" styling
" Plug 'ajh17/Spacegray.vim'
" Plug 'mhinz/vim-janah'
" Plug 'morhetz/gruvbox'
" Plug 'chriskempson/base16-vim'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'noahfrederick/vim-hemisu'
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-colors-pencil'

" language support
Plug 'lervag/vimtex'
" Plug 'klen/python-mode'
" Plug 'valloric/youcompleteme', { 'for': ['c', 'cpp', 'sh', 'python', 'vim'],
"             \ 'do': './install.py --clang-completer'}
" autocmd! User YouCompleteMe if !has('vim_starting') |
"             \ call youcompleteme#Enable() | endif

call plug#end()

" turn off py-mode completion, because we use YouCompleteMe instead
" let g:pymode_rope_completion = 0

" white-list some ycm extra configuration files
" let g:ycm_extra_conf_globlist = ['~/Projekte/scratch/sherpa/*']

" let g:ycm_autoclose_preview_window_after_insertion = 1

" make youcompleteme work with vimtex
" if !exists('g:ycm_semantic_triggers')
"   let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers.tex = [
"       \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
"       \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
"       \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
"       \ 're!\\(include(only)?|input){[^}]*'
"       \ ]

" manual YouCompleteMe loading
" function! EnableYCM()
"     call plug#load('YouCompleteMe')
"     call youcompleteme#Enable()
" endfunction

" set up vimtex-Skim sync
let g:vimtex_view_general_viewer
      \ = '/usr/local/bin/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'


" =================== color scheme ===========================================
if has("gui_running")
  set background=light
  colorscheme pencil
  " colorscheme gruvbox
  " colorscheme PaperColor
  " colorscheme solarized
elseif &t_Co >= 256
  set background=light
  colorscheme pencil
  " let g:airline_theme='pencil'
  " colorscheme janah
  " let g:airline_powerline_fonts=1
  " colorscheme PaperColor
  " colorscheme spacegray
  " colorscheme base16-harmonic16
  " colorscheme base16-codeschool
  " colorscheme solarized
endif


" vim: shiftwidth=2 softtabstop=2
