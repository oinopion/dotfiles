#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

DEBIAN_PACKAGES=("fish" "exa" "zoxide" "fzf" "fd-find" "bat" "curl" "httpie" "ripgrep" "vim" "direnv")
BREW_PACKAGES=("fish" "eza" "zoxide" "fzf" "fd" "bat" "curl" "httpie" "ripgrep" "vim" "direnv" "starship")
CONFIG_DIR="$HOME/.config"
SSH_DIR="$HOME/.ssh"
LOCAL_BIN_DIR="$HOME/.local/bin"
LOCAL_FISH_COMPLETIONS_DIR="$HOME/.local/share/fish/vendor_completions.d"
LOCAL_FISH_VENDOR_CONF_DIR="$HOME/.local/share/fish/vendor_conf.d"
LOCAL_FISH_VENDOR_FUNCTIONS_DIR="$HOME/.local/share/fish/vendor_functions.d"

# Runtime constants
OS=$(uname -s)
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

function create_dirs {
  mkdir -p \
    "$LOCAL_BIN_DIR" \
    "$LOCAL_FISH_COMPLETIONS_DIR" \
    "$LOCAL_FISH_VENDOR_CONF_DIR" \
    "$LOCAL_FISH_VENDOR_FUNCTIONS_DIR"
}

function link_ssh_files {
  mkdir -p "$SSH_DIR"
  chmod 700 "$SSH_DIR"
  for entry in "$BASE_DIR"/.ssh/*; do
    ln -fs "$entry" "$HOME/.ssh"
  done
}

function link_dot_config_files {
  set -euo pipefail

  mkdir -p "$CONFIG_DIR"
  for entry in "$BASE_DIR"/.config/*; do
    ln -fs "$entry" "$CONFIG_DIR"
  done
}

function link_top_level_files {
  ln -fs "$BASE_DIR/.alias" "$HOME"
  ln -fs "$BASE_DIR/.bashrc" "$HOME"
  ln -fs "$BASE_DIR/.zshrc" "$HOME"
  ln -fs "$BASE_DIR/.vimrc" "$HOME"
}

function install_linux_packages {
  set -euo pipefail

  if ! (dpkg-query --show "${DEBIAN_PACKAGES[@]}" > /dev/null); then
    sudo apt-get update
    DEBIAN_FRONTEND=noninteractive \
      sudo apt-get install -y --no-install-recommends "${DEBIAN_PACKAGES[@]}"

    # Debian has renames binaries for fd and bat
    ln -fs /usr/bin/fdfind "$LOCAL_BIN_DIR/fd"
    ln -fs /usr/bin/batcat "$LOCAL_BIN_DIR/bat"
  fi

  if ! (command -v starship > /dev/null); then
    echo "Installing starship..."
    curl -sSf https://starship.rs/install.sh | sh -s -- --yes --bin-dir "$LOCAL_BIN_DIR" > /dev/null
    echo "Starship successfully installed to $LOCAL_BIN_DIR"
    "$LOCAL_BIN_DIR/starship" completions fish > "$LOCAL_FISH_COMPLETIONS_DIR/starship.fish"
  fi
}

function install_brew_packages() {
  if ! (brew list "${BREW_PACKAGES[@]}" &> /dev/null); then
    brew install "${BREW_PACKAGES[@]}"
  fi

  # brew doesn't complete fzf setup, do it here
  brew_prefix=$(brew --prefix)
  ln -fs "$brew_prefix/opt/fzf/shell/key-bindings.fish" "$LOCAL_FISH_VENDOR_FUNCTIONS_DIR/fzf_key_bindings.fish"

  # exa has been replaced by eza, but it's not available in old debian's yet; link eza to exa to preserve aliases
  ln -fs "$brew_prefix/bin/eza" "$LOCAL_BIN_DIR/exa"
}

function main {
  set -euo pipefail

  create_dirs
  link_ssh_files
  link_dot_config_files
  link_top_level_files
  if [[ $OS = "Linux" ]]; then
    install_linux_packages
  elif [[ $OS = "Darwin" ]]; then
    install_brew_packages
  fi
}

main
