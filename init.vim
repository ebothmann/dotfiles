" configuration for NeoVim and vim


" =================== settings ===============================================

let isneovim = (v:progname =~? "nvim")

if !isneovim
  if &compatible
    set nocompatible
  endif
  set incsearch
endif

" general
set splitbelow
set splitright

" visuals
set number
if has('termguicolors')
  set termguicolors
endif
set list                        " show non-printable characters
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
endif

" search and replace
set ignorecase                  " ignore case, but only if ...
set smartcase                   " ... the search string is all lower-case

" input
set ttimeout
set ttimeoutlen=10


" =================== plugins ================================================

set runtimepath+=~/.dotfiles/dein/repos/github.com/Shougo/dein.vim

if dein#load_state("~/.dotfiles/dein/repos/github.com/Shougo/dein.vim")
  call dein#begin("~/.dotfiles/dein/plugins")

  call dein#add("~/.dotfiles/dein/repos/github.com/Shougo/dein.vim")

  " working with projects
  call dein#add('embear/vim-localvimrc')

  " interface
  call dein#add('Shougo/denite.nvim')
  " call dein#add('atelierbram/Base2Tone-vim')
  call dein#add('morhetz/gruvbox')

  " completion
  if isneovim
      call dein#add('Shougo/deoplete.nvim')
      call dein#add('Rip-Rip/clang_complete',
                  \ {'on_ft': ['c', 'cpp']})
  endif

  " navigation
  call dein#add('farmergreg/vim-lastplace')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('derekwyatt/vim-fswitch',
        \ {'on_ft': ['c', 'cpp']})
  call dein#add('majutsushi/tagbar',
        \ {'on_ft': ['c', 'cpp']})

  " editing
  call dein#add('tpope/vim-commentary')
  call dein#add('vim-scripts/ReplaceWithRegister')

  " language support
  call dein#add('keith/tmux.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" configure deoplete
let g:deoplete#enable_at_startup = 1

" configure clang_complete
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
let g:clang_use_library = 1
let g:clang_library_path='/usr/local/opt/llvm/lib/'

" configure denite file_rec source
if executable('ag')
    call denite#custom#var('file_rec', 'command',
                \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

" configure denite grep source
if executable('ag')
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts',
                \ ['-i', '--vimgrep', '--follow'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
elseif executable('ack')
    call denite#custom#var('grep', 'command', ['ack'])
    call denite#custom#var('grep', 'default_opts',
            \ ['--ackrc', $HOME.'/.ackrc', '-H',
            \  '--nopager', '--nocolor', '--nogroup', '--column'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--match'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
endif

" configure localvimrc
let g:localvimrc_sandbox=0
let g:localvimrc_whitelist=$HOME.'/Projekte/scratch/\(sherpa\|hej\)/.*'
let g:localvimrc_event=[ "BufEnter" ]  " otherwise 'vim <dir>' does not trigger


" =================== color scheme ===========================================

" colorscheme Base2Tone_MorningLight
set background=light
let g:gruvbox_italic=1
if !has('termguicolors')
  let g:gruvbox_termcolors=16
endif
colorscheme gruvbox


" =================== mappings ===============================================

" use space and alt-space as leaders
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Quickly open fuzzy file finder
nnoremap <silent> <leader>f :Denite file_rec<CR>
nnoremap <silent> <leader>g :Denite grep<CR>

" toggle header/implementation file
nnoremap <silent> <Leader>t :FSHere<cr>

" toggle tag bar
nmap <silent> <Leader>r :TagbarToggle<CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
nnoremap <silent> <leader>vs :so $MYVIMRC<CR>

" use Ctrl-hjkl to move between windows, cf.
" http://stackoverflow.com/questions/33833642/ctrl-h-mapping-in-neovims-terminal-emulator
" for fixing C-h for NeoVim
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable highlighting
nnoremap <leader>h :nohlsearch<cr>

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

" vim: shiftwidth=2 softtabstop=2 expandtab
