#!/bin/bash
function install_if_not_found {
  if [[ ! -d "$1" ]]; then
    git clone --depth=1 "$2" "$1"
  fi
}

# Antidote zsh package manager
install_if_not_found "$HOME/.antidote" https://github.com/mattmc3/antidote.git
