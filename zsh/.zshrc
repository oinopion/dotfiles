# Path to oh-my-zsh config
ZSH=$HOME/.oh-my-zsh

# Disable built-in themes (pure is external)
ZSH_THEME=""

# Select oh-my-zsh plugins
plugins=(git osx mix)

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

# Python startup
export PYTHONSTARTUP="$HOME/.pythonrc.py"
export PYTHONDONTWRITEBYTECODE="1"

# Custom aliases
source $HOME/.alias
