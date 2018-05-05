# Prezto setting
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# alias
alias vi=nvim
alias cls='clear'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias so='source'

export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
