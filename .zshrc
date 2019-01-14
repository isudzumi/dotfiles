DOTDIR=$(dirname $(readlink ~/.zshrc))

# Prezto setting
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

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
keychain --nogui -q ~/.ssh/id_rsa
source ~/.keychain/`uname -n`-sh

if [ -f $DOTDIR/.alias ]; then
  source "$DOTDIR/.alias"
fi
