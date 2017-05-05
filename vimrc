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
  set undodir=~/.vim/undofiles  " store undo files centrally ...
  " ... and make sure the central location exists
  if filewritable(&undodir) == 0 | call mkdir(&undodir, "p") | endif
endif
if has('mouse')
  set mouse=a                   " enable mouse
endif
set splitbelow
set splitright

" visuals
if has('termguicolors')
  set termguicolors
endif
set showcmd                     " display incomplete commands
set number
set list                        " show non-printable characters
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif
set cursorline

" search and replace
set ignorecase                  " ignore case, but only if ...
set smartcase                   " ... the search string is all lower-case

" coloring (if colors available)
if &t_Co > 2 || has("gui_running")
  set hlsearch                  " enable last search pattern highlighting
endif

" tabs
set shiftwidth=4                " >> indents by 4 spaces
set softtabstop=4               " tab key indents by 4 spaces
set expandtab                   " use spaces instead of tabs
set shiftround                  " >> indents to next multiple of 'shiftwidth'

" set our default tex format
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

" expand %% to the directory of the current buffer
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" allow to use the dot command in visual mode
vnoremap . :norm.<CR>


" =================== plugins ================================================

call plug#begin('~/.vim-plug')

" base configuration
Plug 'tpope/vim-sensible'

" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'  " adaptable abbreviations and replacements
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-endwise'        " wisely add end/endfunction/endif
Plug 'tommcdo/vim-exchange'     " exchange text regions with the cx operator

" navigating/interacting
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
let g:easytags_auto_highlight = 0
let g:easytags_async = 1
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'tpope/vim-unimpaired'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'bogado/file-line'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
Plug 'farmergreg/vim-lastplace'
" Plug 'tpope/vim-vinegar'

" styling
Plug 'lifepillar/vim-solarized8'
Plug 'AlessandroYorba/Sidonia'
Plug 'KabbAmine/yowish.vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'morhetz/gruvbox'

" language support
Plug 'lervag/vimtex'
Plug 'valloric/youcompleteme', { 'for': ['c', 'cpp', 'tex', 'python'],
            \ 'do': './install.py --clang-completer'}
Plug 'tmux-plugins/vim-tmux'

" other
Plug 'lifepillar/vim-cheat40'   " open cheat sheet with <leader>?

call plug#end()


" =================== configure local_vimrc ==================================

" white-list local vimrc files
call lh#local_vimrc#munge('whitelist', $HOME.'/Projekte/scratch/sherpa')
call lh#local_vimrc#munge('whitelist', $HOME.'/Projects/scratch/sherpa')
call lh#local_vimrc#munge('whitelist', $HOME.'/scratch/sherpa')
call lh#local_vimrc#munge('whitelist', $HOME.'/Projekte/quickshower')
call lh#local_vimrc#munge('whitelist', $HOME.'/Projekte/scratch/hej')


" =================== configure completion ===================================

" turn off py-mode completion, because we use YouCompleteMe instead
" let g:pymode_rope_completion = 0

" white-list some ycm extra configuration files
let g:ycm_extra_conf_globlist = ['~/Projekte/scratch/sherpa/*', '~/Projekte/scratch/hej/*']

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


" =================== configure vimtex =======================================
"
" set up vimtex-Skim sync
let g:vimtex_view_general_viewer
      \ = '/usr/local/bin/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'


" =================== color scheme ===========================================

" colorscheme Base2Tone_MorningLight
if !has('termguicolors')
  let g:gruvbox_termcolors=16
endif
set background=light
let g:gruvbox_italic=1
colorscheme gruvbox

" vim: shiftwidth=2 softtabstop=2
