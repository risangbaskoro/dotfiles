# dotfiles

This is the `dotfiles` configuration for my Unix-based OS. It includes some configs, e.g `.zshrc`, `.p10k.zsh`, and more.

This repo is meant to build a portable and reproducible development environments.

# Usage

> [!warning]
> Using this guide may replace all your current configurations. I recommend you to create backups for those configs.

To use these configs, you first need to clone this repository in your `$HOME` directory:
```shell
git clone https://github.com/risangbaskoro/dotfiles.git
```

Then, you will need to have a CLI tool called [`stow`](https://www.gnu.org/software/stow/). `stow` is a symlink manager which takes these dotfiles from your `$HOME` directory and makes them appear to be installed in the same place. In other words, `.zshrc` could be a symlink to `~/dotfiles/.zshrc`.

You can install `stow` via your favorite package manager.

```shell
# For macOS using Homebrew
brew install stow

# For Arch Linux using pacman
pacman -S stow
```

After that, you can start symlinking all the config files:
```
# From $HOME directory
cd ~
stow dotfiles

# or from dotfiles directory
cd ~/dotfiles
stow .
```

Voila! Your zsh, terminal, and all other configs are there. You can start right away!

# Using nix (optional)

Nix is a package manager and programming language that can be used to build software for Unix-like systems.

> [!note]
> The current nix configuration is for a **Mac with an Intel processor** only.
> View the `nix` directory and the [nix documentation](https://nix.dev) for more info.

## Install nix
To install nix, you will need to use the following command:

```shell
sh <(curl -L https://nixos.org/nix/install)
```

Verify your installation using:

```shell
which nix-info
```

If it outputs a directory, then you are good to go.

## Using nix-darwin

> [!note]
> nix-darwin overview

To install `nix-darwin`:
```shell
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/nix#laptop
```

To apply changes to your system:
```shell
darwin rebuild switch --flake ~/nix#laptop
```

> [!warning]
> This nix config will also install GUI apps, which may be bloating your system if you are not using them.
> It also will apply changes to your system, such as *hiding the dock* and *set dock apps*.
> Use it at your own risks.

## License
This repository does not have a license. Use it freely.
