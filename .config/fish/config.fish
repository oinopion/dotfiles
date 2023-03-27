if test $REMOTE_CONTAINERS = true
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
