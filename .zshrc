if [ $(uname -s) = 'Darwin' ]; then
    alias readlink=greadlink
fi
DOTDIR=$(dirname $(readlink -f ~/.zshrc))

# Prezto setting
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

eval "$(starship init zsh)"

export PATH=$PATH:/usr/local/mysql/bin

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

export EDITOR=nvim

# custom completion settings
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

eval "$(direnv hook zsh)"
export PATH="$(dirname $(pyenv which pip)):$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
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

export LSCOLORS=gxfxcxdxbxegedabagacad











# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/ito/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/ito/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/ito/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/ito/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/ito/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/ito/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh

if [[ -z "$TMUX" && ! -z "$PS1" ]]; then
  exec tmux
fi

export BW_SESSION="7Qa1sN7X8MyKPVGnVwWNSLi5KF3bar/h/FKclwjcXvNGvDc1y/YBea2HHDj3AdqjZ7p6b8FS1O6+r8eN+4rUIQ=="

# Created by `userpath` on 2019-12-03 05:14:19
export PATH="$PATH:/Users/ito/.local/bin"

# Created by `userpath` on 2019-12-03 05:14:57
export PATH="$PATH:/Users/ito/.local/bin"

# Created by `userpath` on 2019-12-03 05:16:15
export PATH="$PATH:/Users/ito/.local/bin"

# Created by `userpath` on 2019-12-03 05:21:01
export PATH="$PATH:/Users/ito/.local/bin"
