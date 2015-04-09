# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load zsh-users/zsh-history-substring-search

    # save all to init script
    zgen save
fi

# editor
export EDITOR="vim"

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# key binding
bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# completion rules:
# 1. default
# 2. case-insensitive
# 3. e.g. 'f.b' -> 'foo.b'
# 4. e.g. 'bar' -> 'foobar'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# options
setopt auto_cd

# setup prompt
source "${HOME}/.zsh/prompt.zsh"

# aliases
alias l='ls -AlhG'
alias lrt='l -rt'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gl='git log'
alias gs='git status'

# local customization
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
