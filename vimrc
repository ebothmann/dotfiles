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

" use <Space> as a map leader, because as a command it's redundant anyway,
" and because it's easy to reach on all keyboard layouts (a big advantage over
" the default map leader being the backslash)
let mapleader = "\<Space>"

" configure ReplaceWithRegister plug-in to prevent it from overriding gr and
" gR mappings
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r  <Plug>ReplaceWithRegisterVisual
