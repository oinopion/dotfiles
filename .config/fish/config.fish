# Load brew settings if brew installed and not loaded
if test -x "/opt/homebrew/bin/brew" -a -z "$HOMEBREW_PREFIX"
  /opt/homebrew/bin/brew shellenv | source
end

# Ensure local bin dir is on PATH
if ! contains "$HOME/.local/bin" $PATH
  set -gx PATH "$HOME/.local/bin" $PATH
end

# Explicity set SSH agent forwarding for 1Password
if test -f "$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"
  set -gx SSH_AUTH_SOCK "$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"
end

if status --is-interactive
  set -gx BAT_THEME OneHalfDark

  if test "$TERM_PROGRAM" = "vscode"
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

  # Install fzf key bindings:
  #   ctrl-r for searching history
  #   ctrl-t for file completion
  #   ctrl-e for quick cd
  fzf_key_bindings
  bind \ce fzf-cd-widget
end
