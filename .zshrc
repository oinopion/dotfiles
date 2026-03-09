#
# ZSH config
#
# Dependencies:
# - macOS with Homebrew
#   `brew install bat eza fzf zoxide starship zsh-completions zsh-autosuggestions zsh-syntax-highlighting`

#
# Shell history
#
HISTFILE="$HOME/.local/share/zsh_history"
HISTSIZE=100000
SAVEHIST=200000

setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_reduce_blanks
setopt hist_ignore_dups
setopt hist_ignore_space


#
# Keybindings
#

# Characters considered part of a word (default minus / so word navigation stops at path separators)
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Up/Down: search history by prefix (cursor at end of line)
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Alt + Up/Down: search history by prefix (cursor stays at prefix)
bindkey "^[[1;3A" history-beginning-search-backward
bindkey "^[[1;3B" history-beginning-search-forward

# Alt + Left/Right: GUI-style word navigation (stops at punctuation)
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# Ctrl + arrows: vim-style WORD navigation (stops at whitespace)
bindkey "^[[1;5D" vi-backward-blank-word
bindkey "^[[1;5C" vi-forward-blank-word

# Alt + Backspace: delete word
bindkey "^[^?" backward-kill-word
# Custom widget: kill back to whitespace by temporarily restoring / to WORDCHARS
backward-kill-blank-word() { local WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'; zle backward-kill-word; }
zle -N backward-kill-blank-word
# Ctrl + Backspace: delete back to whitespace
bindkey "^H" backward-kill-blank-word


#
# Homebrew setup
#
HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"
if [ -f "$HOMEBREW_PREFIX/bin/brew" ]; then
  eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
fi


#
# Tab completion
#
if [ -d "$HOMEBREW_PREFIX/share/zsh-completions" ]; then
  FPATH="$HOMEBREW_PREFIX/share/zsh-completions:$FPATH"
fi
autoload -Uz compinit && compinit
setopt complete_in_word
setopt auto_menu
setopt autocd


#
# Zsh plugins
#

# Shows as-you-type suggestions based on history and completions
if [ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Highlights command syntax as you type
if [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi


#
# Local executable directory
#
typeset -U path PATH
path+=("$HOME/.local/bin")


#
# Editor
#
if [ -n "$SSH_CONNECTION" ]; then
  export EDITOR="vim"
else
  export EDITOR="code -w"
fi


#
# Shared aliases
#
if [ -f "$HOME/.alias" ]; then
  source "$HOME/.alias"
fi


#
# Tool integrations
#

# Makes `z` command for quickly jumping to frequently used directories
if command -v zoxide > /dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Better shell history search with Ctrl + R
if command -v fzf > /dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi

# Fast, modern prompt with bunch of integrations and customizations
if command -v starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
