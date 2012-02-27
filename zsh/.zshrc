# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="terminalparty"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git mercurial brew osx django)

source $ZSH/oh-my-zsh.sh

# Shell history
HISTSIZE=1000
SAVEHIST=20000

# Fix path for brew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/share/python3:$PATH"
export PATH="/usr/local/share/python:$PATH"

# PIP enchancement
export PIP_DOWNLOAD_CACHE="~/.pip-cache"

# Some key bindings
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
#bindkey "^[[1;5C" forward-word
#bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" kill-word
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# RVM 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Virtualenvwrapper
[[ -s "/usr/local/share/python/virtualenvwrapper.sh" ]] && source "/usr/local/share/python/virtualenvwrapper.sh" 

# Custom aliases
alias githere='git daemon --reuseaddr --base-path=. --export-all --verbose'
alias openports='lsof -i -n -P'
alias debug_mail='python -m smtpd -nc DebuggingServer'
alias pjson='python -mjson.tool'
alias b='bpython'

# django stuff
alias dm='clear && ./manage.py'
alias dt='dm test'
alias dl='dm harvest --settings=lettuce_settings'

alias pyt='clear && py.test'
alias pyclean="find . -name '*.pyc' -delete"

alias mu="workon meetupon"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
