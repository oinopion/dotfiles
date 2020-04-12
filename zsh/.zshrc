# Path to oh-my-zsh config
ZSH=$HOME/.oh-my-zsh

# Disable built-in themes (pure is external)
ZSH_THEME=""

# Select oh-my-zsh plugins
plugins=(
    git 
    osx 
    mix 
    heroku 
    postgres
    docker
    aws
)

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Enable pure theme
fpath+=("$HOME/.zsh-pure")
autoload -U promptinit; promptinit
prompt pure

# Shell history
HISTSIZE=10000
SAVEHIST=20000

# Vim as console editor
export EDITOR='vim'

# Enable asdf version manager
source /usr/local/opt/asdf/asdf.sh
source /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
export NODEJS_CHECK_SIGNATURES="no"

# Python startup
export PYTHONSTARTUP="$HOME/.pythonrc.py"
export PYTHONDONTWRITEBYTECODE="1"

# Enable pipx commands
path+="$HOME/.local/bin"

# Set home for non-module golang packages
export GOPATH="$HOME/.go"
path+="$GOPATH/bin"

# Custom aliases
source $HOME/.alias
