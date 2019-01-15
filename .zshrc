DOTDIR=$(dirname $(readlink ~/.zshrc))

# Prezto setting
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH=$PATH:/usr/local/mysql/bin

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

export EDITOR=nvim

# custom completion settings
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
export PATH="$(dirname $(nodenv which npm)):$PATH"
export PATH="$(dirname $(pyenv which pip)):$PATH"
export GHQ_ROOT=~/repo

if [ $(uname -s) = 'Linux' ]; then
  keychain --nogui -q ~/.ssh/id_rsa
  source ~/.keychain/`uname -n`-sh
fi

if [ -f $DOTDIR/.alias ]; then
  source "$DOTDIR/.alias"
fi
