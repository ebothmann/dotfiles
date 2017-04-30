" configuration for NeoVim

set runtimepath+=~/.dotfiles/dein/repos/github.com/Shougo/dein.vim

if dein#load_state("~/.dotfiles/dein/repos/github.com/Shougo/dein.vim")
  call dein#begin("~/.dotfiles/dein/plugins")

  call dein#add("~/.dotfiles/dein/repos/github.com/Shougo/dein.vim")

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Rip-Rip/clang_complete')

  call dein#end()
  call dein#save_state()
endif

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
