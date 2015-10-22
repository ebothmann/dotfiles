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

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

