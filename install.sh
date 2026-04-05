#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

DEBIAN_PACKAGES=(
  "zsh" "eza" "zoxide" "fzf" "fd-find" "bat" "curl" "httpie" "ripgrep" "vim" "direnv" "starship"
  "zsh-autosuggestions" "zsh-syntax-highlighting"
)
BREW_PACKAGES=(
  "zsh" "eza" "zoxide" "fzf" "fd" "bat" "curl" "httpie" "ripgrep" "vim" "direnv" "starship"
  "zsh-completions" "zsh-autosuggestions" "zsh-syntax-highlighting" "zsh-history-substring-search"
)

CONFIG_DIR="$HOME/.config"
SSH_DIR="$HOME/.ssh"
LOCAL_BIN_DIR="$HOME/.local/bin"
LOCAL_SHARE_DIR="$HOME/.local/share/"

# Runtime constants
OS=$(uname -s)
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

function create_dirs {
  mkdir -p \
    "$LOCAL_BIN_DIR" \
    "$LOCAL_SHARE_DIR" \
    "$CONFIG_DIR"
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
}

function install_brew_packages() {
  if ! (brew list "${BREW_PACKAGES[@]}" &> /dev/null); then
    brew install "${BREW_PACKAGES[@]}"
  fi
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
