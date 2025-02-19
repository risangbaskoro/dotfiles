#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
STOW_VERSION="2.4.1"
STOW_URL="https://ftp.gnu.org/gnu/stow/stow-$STOW_VERSION.tar.gz"
STOW_TARBALL=$(basename "$STOW_URL")

if ! command -v stow >/dev/null 2>&1; then
    echo "GNU Stow is not installed. Trying to install..."
    echo

    # Download stow from GNU's FTP server
    echo "Downloading GNU Stow..."
    curl -fsSLO "$STOW_URL"

    echo "Extracting GNU Stow..."
    # Extract Stow tar and remove the tar
    tar -xzf "$STOW_TARBALL"
    
    # Install Stow
    echo "Installing GNU Stow..."
    cd "stow-$STOW_VERSION" && ./configure && make install

    echo "Cleanup..."
    rm "$STOW_TARBALL"
    rm -rf "stow-$STOW_VERSION"

    echo
    echo "GNU Stow is installed."
    echo
fi

if command -v stow >/dev/null 2>&1; then
    echo "Symlinking files in $DOTFILES_DIR"
    echo "This will run the following command:"
    echo
    echo "> stow $DOTFILES_DIR --target=$HOME"

    cd "$DOTFILES_DIR" && stow . --target="$HOME" && cd

    echo
    echo "Done!"
    echo
    echo "Restarting shell..."
    echo
    exec $SHELL
else
    echo "GNU Stow is still not installed."
    echo
    echo "ABORTING"
fi
