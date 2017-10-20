" configure vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" load fzf
set rtp+=/usr/local/opt/fzf
nmap <silent> <Leader>ff :Files<cr>
nmap <silent> <Leader>fb :Buffers<cr>
nmap <silent> <Leader>fa :Ag<cr>
nmap <silent> <Leader>fl :BLines<cr>
nmap <silent> <Leader>fL :Lines<cr>
nmap <silent> <Leader>ft :BTags<cr>
nmap <silent> <Leader>fT :Tags<cr>
nmap <silent> <Leader>fh :Helptags<cr>

" configure ReplaceWithRegister plug-in to prevent it from overriding gr and
" gR mappings
nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
nmap <Leader>rr <Plug>ReplaceWithRegisterLine
xmap <Leader>r  <Plug>ReplaceWithRegisterVisual

" configure vim-localvimrc
let g:localvimrc_sandbox=0
let g:localvimrc_persistent=2
let g:localvimrc_event=[ "BufEnter" ]  " to make 'vim <dir>' trigger

" configure vim-fswitch switcher
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" configure rooter
"let g:rooter_patterns = ['.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/',
"			\ 'configure.ac']

" configure wiki
let g:vimwiki_list = [{
			\ 'path': '~/wiki/text/',
			\ 'path_html': '~/wiki/html/',
			\ 'template_path': '~/wiki/templates/',
			\ 'template_default': 'def_template',
			\ 'template_ext': '.html'}]

command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

" general
call minpac#add('tpope/vim-unimpaired')
call minpac#add('vimwiki/vimwiki')
call minpac#add('mhinz/vim-randomtag')
call minpac#add('lifepillar/vim-colortemplate')

" navigation
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('vim-scripts/vim-lastplace')
call minpac#add('derekwyatt/vim-fswitch')
call minpac#add('junegunn/fzf.vim')
"call minpac#add('airblade/vim-rooter')

" editing
call minpac#add('vim-scripts/ReplaceWithRegister')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('PeterRincker/vim-argumentative')

" project management
call minpac#add('embear/vim-localvimrc')
