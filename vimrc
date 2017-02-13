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

    " activate limelight hyper-focus writing when entering distraction free
    " mode (goyo)
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!

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

" YCM
nnoremap <Leader>ycm :call EnableYCM()<cr>
nnoremap <Leader>jj :YcmCompleter GoTo<CR>
nnoremap <Leader>jf :YcmCompleter GoToImprecise<CR>
nnoremap <Leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <Leader>jh :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>jc :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gt :YcmCompleter GetType<CR>
nnoremap <Leader>gp :YcmCompleter GetParent<CR>
nnoremap <Leader>gd :YcmCompleter GetDoc<CR>
nnoremap <Leader>ff :YcmCompleter FixIt<CR>

" toggle header/implementation file
nmap <silent> <Leader>t :FSHere<cr>

" toggle tag bar
nmap <silent> <Leader>r :TagbarToggle<CR>

" add space after commas in this line, preserving the previous search string
" TODO: make sure the highlighting is restored if it was on (not only the
" search string), and make it repeatable using vim-repeat plug-in
" nnoremap <Leader>, :let old = @/<cr>:s/,\(\S\)/, \1/<cr>:let @/ = old<cr>:noh<cr>

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
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" navigating/interacting
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
let g:easytags_auto_highlight = 0
let g:easytags_async = 1
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_extensions = ['tag']
Plug 'derekwyatt/vim-fswitch'
Plug 'tpope/vim-unimpaired'
" Plug 'rking/ag.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'christoomey/vim-system-copy'
Plug 'juneedahamed/vc.vim'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'bogado/file-line'
Plug 'christoomey/vim-tmux-navigator'

" styling
Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" language support
Plug 'lervag/vimtex'
" Plug 'klen/python-mode'
Plug 'valloric/youcompleteme', { 'for': ['c', 'cpp', 'tex'],
            \ 'do': './install.py --clang-completer'}
Plug 'tmux-plugins/vim-tmux'

call plug#end()


" =================== configure local_vimrc ==================================

" white-list local vimrc files
call lh#local_vimrc#munge('whitelist', $HOME.'/Projekte/scratch/sherpa')
call lh#local_vimrc#munge('whitelist', $HOME.'/Projects/scratch/sherpa')
call lh#local_vimrc#munge('whitelist', $HOME.'/scratch/sherpa')
call lh#local_vimrc#munge('whitelist', $HOME.'/Projekte/css-sort/rivet-2.5.2')


" =================== configure completion ===================================

" turn off py-mode completion, because we use YouCompleteMe instead
" let g:pymode_rope_completion = 0

" white-list some ycm extra configuration files
let g:ycm_extra_conf_globlist = ['~/Projekte/scratch/sherpa/*']

" let g:ycm_autoclose_preview_window_after_insertion = 1

" make youcompleteme work with vimtex
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ]

" manual YouCompleteMe loading
function! EnableYCM()
    call plug#load('YouCompleteMe')
    call youcompleteme#Enable()
endfunction


" =================== configure vimtex =======================================
"
" set up vimtex-Skim sync
let g:vimtex_view_general_viewer
      \ = '/usr/local/bin/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'


" =================== color scheme ===========================================

set background=dark
colorscheme base16-railscasts

" if has("gui_running")
" elseif &t_Co >= 256
" endif


" vim: shiftwidth=2 softtabstop=2
