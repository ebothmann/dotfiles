# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    #zgen load sindresorhus/pure
    zgen load nojhan/liquidprompt

    # save all to init script
    zgen save
fi
