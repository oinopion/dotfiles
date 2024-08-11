# Minimal bash config

# Local executable directory
if [[ ! ":$PATH:" == *:"$HOME/.local/bin":* ]]; then
    PATH="$PATH:$HOME/.local/bin"
fi

# Explicity set SSH agent forwarding for 1Password
if [ -O "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ]; then
  export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
fi

# Use VS Code as editor when in dev container, vim otherwise
if [ -n $REMOTE_CONTAINERS ]; then
  export EDITOR="code -w"
else
  export EDITOR="vim"
fi

# Shared aliases
if [ -f "$HOME/.alias" ]; then
    source "$HOME/.alias"
fi

eval "$(starship init bash)"
