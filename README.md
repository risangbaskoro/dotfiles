# dotfiles

`dotfiles` configuration for my Unix-based OS. It includes some configs, e.g `.zshrc`, `.bashrc`, `.shell_aliases`, and more.

This repo is meant to build a portable and reproducible development environments.

## Usage

> [!note]
> Using this guide may replace all your current configurations. I recommend you to create backups for those configs.

> [!warning]
> **I am not responsible for any loss of your configuration files.**

To use these configs, you first need to clone this repository in your `$HOME` (or `~`) directory.
```shell
git clone https://github.com/risangbaskoro/dotfiles.git ~/dotfiles

# or

git clone https://codeberg.org/baskoro/dotfiles.git ~/dotfiles
```

Then follow through the installation process below:
### Install Using the Installation Script

I have provided an installation script, named `install`. Here's a summary of what it does:
- If GNU Stow is not installed, **try to install GNU Stow** using your system's package manager.
- Using GNU Stow, **create symlinks for all the files inside the `dotfiles` directory** in the `$HOME` directory.

To use the installation script, simply call it:

```shell
chmod +x ~/dotfiles/install
bash ~/dotfiles/install
```

> [!NOTE]
> If the system already has some configuration files that the `dotfiles` has, it will abort the `stow` process. Stow is already installed by then.
> 
> For each warning that `stow` throws, create a backup for those files.
> 
> For example, if `.bashrc` already exists in your `$HOME` directory, you can rename it to `.bashrc.backup` using the `mv` command: `mv ~/.bashrc ~/.bashrc.backup`
>
> See: https://www.gnu.org/software/stow/manual/stow.html#Conflicts

Done. Your shell, terminal, and all other configs are there.

### Install Manually Using GNU Stow

Then, you will need to have a CLI tool called [`stow`](https://www.gnu.org/software/stow/). `stow` is a symlink manager which takes these dotfiles from your `$HOME` directory and makes them appear to be installed in the same place. In other words, `.zshrc` could be a symlink to `~/dotfiles/.zshrc`.

You can install `stow` via your favorite package manager.

```shell
# For macOS using Homebrew
brew install stow

# For Arch Linux using pacman
pacman -S stow
```

After that, you can start create symlinks for all the config files:
```
# From $HOME directory
cd ~
stow dotfiles

# or from dotfiles directory
cd ~/dotfiles
stow .
```

Voila! You can start right away!

## License

This repository does not have a license. Use it freely.
