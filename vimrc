" do not bother with old versions
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

set wildignorecase
set wildmode=longest,full

set laststatus=2
set noshowmode

set termguicolors

let g:airline_theme='sol'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:tmuxline_powerline_separators = 1

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
let g:localvimrc_whitelist=[$HOME.'/Projekte/scratch/\(sherpa\|hej\)/.*',
			\ $HOME.'/Projekte/sherpa-workshop-report/.*',
			\ $HOME.'/Projekte/sherpa-paper/.*',
			\ $HOME.'/Projekte/quickshower/quickshower/.*']
let g:localvimrc_event=[ "BufEnter" ]  " otherwise 'vim <dir>' does not trigger

" configure tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" configure rooter
let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/', 'configure.ac']

" configure implementation/header switcher
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" configure wiki
let g:vimwiki_list = [{'path': '~/wiki/text/',
			\ 'path_html': '~/wiki/html/',
			\ 'template_path': '~/wiki/templates/',
			\ 'template_default': 'def_template',
			\ 'template_ext': '.html'}]

" vim: ts=4 sw=4
