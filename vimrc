unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set splitbelow
set splitright

set hidden

set hlsearch

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set langmap=ü[,+]

set termguicolors
set background=dark
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

nmap <Leader>h :nohlsearch<CR>

set undofile
set undodir=~/.vim/undo

" configure localvimrc
let g:localvimrc_sandbox=0
let g:localvimrc_whitelist=$HOME.'/Projekte/scratch/\(sherpa\|hej\)/.*'
let g:localvimrc_event=[ "BufEnter" ]  " otherwise 'vim <dir>' does not trigger

" vim: ts=4 sw=4
