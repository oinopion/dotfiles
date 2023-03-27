# Minimal bash config

# Local executable directory
if [[ ! ":$PATH:" == *:"$HOME/.local/bin":* ]]; then
    PATH="$PATH:$HOME/.local/bin"
fi

# Use VS Code as editor when in dev container, vim otherwise
if [ $REMOTE_CONTAINERS = true ]; then
  export EDITOR="code -w"
else
  export EDITOR="vim"
fi

alias ll="ls -l"
alias la="ls -la"

# Shared aliases
if [ -f "$HOME/.alias" ]; then
    source "$HOME/.alias"
fi

eval "$(starship init bash)"
