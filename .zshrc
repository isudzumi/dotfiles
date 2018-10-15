DOTDIR=$(dirname $(readlink ~/.bashrc))

# Prezto setting
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [ -f $DOTDIR/.alias ]; then
    . $DOTDIR/.alias
fi

export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PATH=$PATH:/usr/local/mysql/bin

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# NODE settings
eval "$(nodenv init -)"
export NODE_ENV=development

export EDITOR=nvim

# custom completion settings
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

