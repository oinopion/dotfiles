# Minimal ZSH config

# Shell history
HISTFILE="$HOME/.local/share/zsh_history"
HISTSIZE=10000
SAVEHIST=20000

# All zsh sessions share history
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_reduce_blanks

# Tab completion
autoload -Uz compinit && compinit
setopt complete_in_word
setopt auto_menu
setopt autocd

# Bind alt-left and alt-right to words navigation
bindkey "[D" vi-backward-blank-word
bindkey "[C" vi-forward-blank-word

# Local executable directory
typeset -U path PATH
path+="$HOME/.local/bin"

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

eval "$(starship init zsh)"
