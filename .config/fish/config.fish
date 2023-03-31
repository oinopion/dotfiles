# Load brew settings if brew installed and not loaded
if test -x "/opt/homebrew/bin/brew" -a -z "$HOMEBREW_PREFIX"
  /opt/homebrew/bin/brew shellenv | source
end

# Ensure local bin dir is on PATH
if ! contains "$HOME/.local/bin" $PATH
  set -gx PATH "$HOME/.local/bin" $PATH
end

if status --is-interactive
  set -gx BAT_THEME Dracula

  if test -n $REMOTE_CONTAINERS
    set -gx EDITOR code -w
  else
    set -gx EDITOR vim
  end

  if test -f "$HOME/.alias"
    source "$HOME/.alias"
  end

  # Starship prompt
  starship init fish | source

  # Zoxide
  zoxide init fish | source

  # Direnv
  direnv hook fish | source
end
