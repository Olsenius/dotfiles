#!/bin/sh
if  command -v starship >/dev/null 2>&1; then 
    echo "starship already installed"
else
    curl -sS https://starship.rs/install.sh | sh
fi