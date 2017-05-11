# editor
export EDITOR="vim"

# history
HISTSIZE=2000
SAVEHIST=2000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
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
alias tnew='tmux new -s'
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
alias gs='git status'
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

# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load rupa/z
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # save all to init script
    zgen save
fi

# only bind history-substring search keys here, otherwise
# zsh-syntax-highlighting warns, cf.
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/340
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
