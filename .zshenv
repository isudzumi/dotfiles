# Setting XDG base directory
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p ${XDG_CACHE_HOME:=$HOME/.cache}
mkdir -p ${XDG_DATA_HOME:=$HOME/.local/share}

export PYENV_ROOT=~/.pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
