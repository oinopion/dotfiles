# Minimal bash config

alias ll="ls -l"
alias la="ls -la"

# Shared aliases
if [ -f "$HOME/.alias" ]; then
    source "$HOME/.alias"
fi

eval "$(starship init bash)"
