# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin:~/.local/bin:~/.yarn/bin
export GHQ_ROOT=~/repo

export DISPLAY=localhost:0.0

if [ -d "~/.poetry/env" ]; then
    . "~/.poetry/env"
fi

. ~/.env.local

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -f "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Setting XDG base directory
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p ${XDG_CACHE_HOME:=$HOME/.cache}
mkdir -p ${XDG_DATA_HOME:=$HOME/.local/share}

# if [ `uname -s` = "Linux" ]; then
#   keychain --nogui -q ~/.ssh/id_rsa
#   source ~/.keychain/`uname -n`-sh
# fi

export PATH="$HOME/.cargo/bin:$PATH"

# if [ -z $TMUX ]; then
#     exec tmux
# fi

export PATH="$HOME/.poetry/bin:$PATH"
export PATH=/usr/lib/llvm-10/bin:$PATH
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="~/.deno/bin:$PATH"
