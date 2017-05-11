unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set splitbelow
set splitright

set hidden

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set langmap=ü[,+]

set termguicolors
set background=light
let g:gruvbox_italic=1
colorscheme gruvbox
