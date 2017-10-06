DOTFILES_PATH="${HOME}/.dotfiles"

path=("${DOTFILES_PATH}/bin" $path)
export PATH

# editor
export EDITOR="vim"

# history
HISTSIZE=2000
SAVEHIST=2000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
HISTFILE=~/.history

# key binding
bindkey -v

# make mode-switching faster
export KEYTIMEOUT=1

# completion rules:
# 1. default
# 2. case-insensitive
# 3. e.g. 'f.b' -> 'foo.b'
# 4. e.g. 'bar' -> 'foobar'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# options
setopt auto_cd
setopt extendedglob

# shortcuts: general
alias v="$EDITOR"
alias v.='v .'
alias lrt='l -rt'
alias ta='tmux attach -t'
alias tls='tmux ls'
function tproj() { mkdir -p "$HOME/Projekte/$@" && tmux new-session -c "$HOME/Projekte/$@" -s "$@" ;}
alias svim='vim -u NONE -N'  # open vim without ~/.vimrc or defaults.vim, but enable nocompatible
alias killz='kill -9 %%'
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# shortcuts: version control
alias ga='git add'
alias sa='svn add'  # note that we overwrite a system binary by this
alias gc='git commit'
alias sc='svn commit'
alias gd='git diff'
function sd() { svn diff $@ | colordiff | less -r ;}
alias gl='git log'
alias sl='svn log'
alias glp='git log-pretty'
alias gs='git status -s'
alias ss='svn status'

# shortcuts: scan-build
alias sb="scan-build"
alias sbi="intercept-build --append"
alias sba="analyze-build"

# shortcuts: voltron
function vsrc() {
    voltron view command 'source list -a $rip -c 25' --lexer cpp
}

# dotfiles_local customization
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# single machine customization
if [ -f ~/.zshrc_single ]; then
    source ~/.zshrc_single
fi

# load plug-ins using zplug
source "${DOTFILES_PATH}/zplug/init.zsh"
zplug "rupa/z", at:772db28548  # pull-request (#199) commit fixes #198
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# Then, source plugins and add commands to $PATH
zplug load

# only bind history-substring search keys here, otherwise
# zsh-syntax-highlighting warns, cf.
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/340
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
