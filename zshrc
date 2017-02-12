# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load rupa/z
    zgen load zsh-users/zsh-history-substring-search
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure

    # save all to init script
    zgen save
fi

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
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# completion rules:
# 1. default
# 2. case-insensitive
# 3. e.g. 'f.b' -> 'foo.b'
# 4. e.g. 'bar' -> 'foobar'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# options
setopt auto_cd

# shortcuts: general
alias lrt='l -rt'
alias ta='tmux attach -t'
alias svim='vim -u NONE -N'  # open vim without ~/.vimrc, but enable nocompatible
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

# dotfiles_local customization
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# single machine customization
if [ -f ~/.zshrc_single ]; then
    source ~/.zshrc_single
fi
