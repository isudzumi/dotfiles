# Setting XDG base directory
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p ${XDG_CACHE_HOME:=$HOME/.cache}
mkdir -p ${XDG_DATA_HOME:=$HOME/.local/share}

export NVIM_PYTHON_LOG_FILE="/tmp/log"

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

if [ -f .env ]; then
    source .env
fi
