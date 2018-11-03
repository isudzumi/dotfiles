# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Setting XDG base directory
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p ${XDG_CACHE_HOME:=$HOME/.cache}
mkdir -p ${XDG_DATA_HOME:=$HOME/.local/share}

if [ `uname -s` = "Darwin" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
  eval "$(pyenv virtualenv-init -)"
fi

if [ `uname -s` = "Linux" ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  export PATH="$(dirname $(nodenv which npm)):$PATH"
  export PATH="$(dirname $(pyenv which pip)):$PATH"
  export GHQ_ROOT=~/repo
  keychain --nogui -q ~/.ssh/id_rsa
  source ~/.keychain/`uname -n`-sh
fi
