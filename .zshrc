# Prezto setting
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# alias
alias vi=nvim
alias git=hub
alias less=/usr/local/Cellar/neovim/0.2.2_1/share/nvim/runtime/macros/less.sh
alias cls='clear'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias so='source'

alias grep='rg'

alias gl='ghq look'
alias gg='ghq get -p'

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

