" fall back to sensible defaults old versions
if v:version < 800
	source $HOME/.vim/sensible/plugin/sensible.vim
	finish
endif

" use defaults.vim, but remove jump to last position autocmd, since we use the
" lastplace plug-in, which keeps the cursor on the first line for commit
" messages
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
augroup vimStartup
	au!
augroup END

set splitbelow
set splitright
set hidden
set hlsearch
set ignorecase
set smartcase
set wildignorecase
set wildmode=longest:full,full
set laststatus=2
set noshowmode
set undofile
set undodir=~/.vim/undo
set spelllang=en_gb  " use de_20 for new German spelling
set listchars=eol:¬,tab:⇥\ ,trail:·,nbsp:~
set list

set termguicolors
colorscheme gitty_up

" use <Space> as a map leader, because as a command it's redundant anyway, and
" because it's easy to reach on *all* keyboard layouts (a big advantage over
" the default map leader being the backslash)
let mapleader = "\<Space>"

" functions and aliases
nmap <Leader>h :nohlsearch<CR>
function! ShowSyntaxGroupUnderCursor()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nmap <Leader>c :call ShowSyntaxGroupUnderCursor()<CR>

" auto-commands
augroup vimrc
	au!
	au FileType gitcommit set spell
	au FileType svn set spell
augroup END

source ~/.vim/packages.vim

" vim: ts=4 sw=4
