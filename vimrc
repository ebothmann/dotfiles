" use defaults.vim, but remove jump to last position autocmd, since we use the
" lastplace plug-in, which keeps the cursor on the first line for commit
" messages
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
augroup vimStartup | au! | augroup END

set splitbelow
set splitright

set hidden

set hlsearch

set wildignorecase
set wildmode=longest,full

" configure vim for a german keyboard layout
"
" NOTE: CTRL-ä is ESC, CTRL-ö is CTRL-\, CTRL-ü is not available (and neither
" are CTRL-+ or CTRL-#)
"
" NOTE: it is not a good idea to use ü and + as replacements for [ and ],
" which would be the natural choice comparing the german and the english
" keyboard layouts, because + is not only a (redundant) command, but also the
" name for a register, therefore use ö and ä
"
" to make combinations like [[ work, we need to use langmap, langnoremap
" however is not needed because ö and ä are not being defined anywhere else
set langmap=ö[,ä],Ö{,Ä}
" to make mappings from plug-ins such as unimpaired work, we also need to map
" the keys (recursively)
nmap ö [
nmap ä ]
nmap Ö {
nmap Ä }
omap ö [
omap ä ]
omap Ö {
omap Ä }
xmap ö [
xmap ä ]
xmap Ö {
xmap Ä }
" we have not used ü so far, let's make that our replacement for CTRL-]
nnoremap ü <C-]>

" set background dynamically according to override file or day time
if filereadable($HOME."/.coloroverride")
	let g:coloroverride = readfile($HOME."/.coloroverride")[0]
	let &background=g:coloroverride
else
	let hour = strftime("%H")
	if +$BACKGROUND_LIGHT_HOUR <= hour && hour < +$BACKGROUND_DARK_HOUR
		set background=light
	else
		set background=dark
	endif
endif

set termguicolors
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

" vim: ts=4 sw=4
