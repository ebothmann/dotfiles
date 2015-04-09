# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # save all to init script
    zgen save
fi

# setup prompt
source "${HOME}/.zsh/prompt.zsh"

# aliases
alias l='ls -AlhG'
alias gd='git diff'
alias gs='git status'
alias gl='git log'
alias gc='git commit'

# local customization
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
