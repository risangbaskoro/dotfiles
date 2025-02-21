#!/bin/bash

function symlink {
    SOURCE="${PWD}/$1"
    TARGET="${HOME}/$1"

    echo
    if [ -f ${TARGET} ]; then
        read -p "File ${TARGET} exists. Do you want to create a backup? [Y/n] " choice
        if [[ "${choice^^}" == N ]]; then
            echo "Skipping ${SOURCE}"
            return
        else
            echo "Backing up: ${SOURCE} -> ${TARGET}.bak..."
            mv "${TARGET}" "$TARGET.bak"
        fi
    fi

    if [ ! -d $(dirname ${TARGET}) ]; then
        echo "Creating directory $(dirname ${TARGET})..."
        mkdir -p $(dirname ${TARGET})
    fi

    echo "Creating symlink: ${SOURCE} -> ${TARGET}..."
    ln -srF "${SOURCE}" "${TARGET}"
    echo "Created symlink: ${SOURCE} -> ${TARGET}."
}

# Just making sure
mkdir -p ~/.config

# Symlinks
symlink .hushlogin

symlink .bashrc

symlink .zshrc
symlink .p10k.zsh
