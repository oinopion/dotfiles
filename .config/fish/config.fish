if test -d "/opt/homebrew"
  /opt/homebrew/bin/brew shellenv | source
end

if ! contains "$HOME/.local/bin" $PATH
  set -gx PATH "$HOME/.local/bin" $PATH
end

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
