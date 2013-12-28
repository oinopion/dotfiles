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
HISTSIZE=10000
SAVEHIST=20000

# Fix path for brew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"


# PIP enchancement
export PIP_DOWNLOAD_CACHE="~/.pip-cache"

# Editor
export EDITOR='vim'

# Some key bindings
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
#bindkey "^[[1;5C" forward-word
#bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" kill-word
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Virtualenvwrapper
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh" 

# Custom aliases
alias githere='git daemon --reuseaddr --base-path=. --export-all --verbose'
alias openports='lsof -i -n -P'
alias debug_mail='python -m smtpd -nc DebuggingServer'
alias pjson='python -mjson.tool'

alias gs='git status'
alias gc='git commit'

# django stuff
alias dm='clear && ./manage.py'
alias dt='dm test'

alias pyt='clear && py.test'
alias pyclean="find . -name '*.pyc' -delete"

alias t='tree -L 2'

alias sv='sudo vim'
alias wo='workon'

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'



