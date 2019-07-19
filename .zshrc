if [ $(uname -s) = 'Darwin' ]; then
    alias readlink=greadlink
fi
DOTDIR=$(dirname $(readlink -f ~/.zshrc))

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

if [ -d $HOME/.cargo ]; then
  source "$HOME/.cargo/env"
fi

if [ -d $HOME/.deno ]; then
  export PATH="$HOME/.deno/bin:$PATH"
  export DENO_DIR="$HOME/.deno"
fi

if [ -f $DOTDIR/.alias ]; then
  source "$DOTDIR/.alias"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ito/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/ito/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ito/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/ito/google-cloud-sdk/completion.zsh.inc'; fi
