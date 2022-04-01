# Path to oh-my-zsh config
ZSH=$HOME/.oh-my-zsh

# Disable built-in themes (pure is external)
ZSH_THEME=""

# Select oh-my-zsh plugins
plugins=(
    git
    macos
    mix-fast
    postgres
    docker
    aws
    z
    docker-compose
    httpie
    # kubectl
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

# Bind alt-left and alt-right to words navigation
bindkey "[D" vi-backward-blank-word
bindkey "[C" vi-forward-blank-word

# Enable asdf version manager
source /opt/homebrew/opt/asdf/libexec/asdf.sh
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

# Brew path fixes
OPENSSL_PREFIX="$(brew --prefix openssl)/bin:$PATH"
export PATH="$OPENSSL_PREFIX/bin:$PATH"
export LDFLAGS="$LDFLAGS -I$OPENSSL_PREFIX/include -L$OPENSSL_PREFIX/lib"
export CPPFLAGS="$CPPFLAGS -I$OPENSSL_PREFIX/include -L$OPENSSL_PREFIX/lib"

