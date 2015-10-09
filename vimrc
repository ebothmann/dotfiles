call plug#begin('~/.vim-plug')

Plug 'altercation/vim-colors-solarized'
" Plug 'chriskempson/vim-tomorrow-theme'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

syntax enable
set background=dark
colorscheme solarized
" colorscheme Tomorrow
filetype plugin on
let mapleader = ","
let NERDSpaceDelims=1
