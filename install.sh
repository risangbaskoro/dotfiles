#!/bin/bash

if which stow > /dev/null 2>&1; then
	echo "Using stow to link config files..."
	stow . --adopt
	echo "Done."
else
	# Define source and destination
	DOTFILES_DIR="$HOME/dotfiles"
	BASHRC_TARGET="$HOME/.bashrc"

	# Backup existing .bashrc if it exists
	if [ -f "$BASHRC_TARGET" ] || [ -L "$BASHRC_TARGET" ]; then
	    echo "Backing up existing ~/.bashrc to ~/.bashrc.backup"
	    mv "$BASHRC_TARGET" "$HOME/.bashrc.backup"
	fi

	# Create symbolic link
	ln -s "$DOTFILES_DIR/.bashrc" "$BASHRC_TARGET"

	echo "Symbolic link created: ~/.bashrc -> ~/dotfiles/.bashrc"
fi

