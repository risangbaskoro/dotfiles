# dotfiles

This is the dotfiles configuration for my Unix-based OS. It includes some configs, e.g `.zshrc`, `.p10k.zsh`, and more.

## Usage
To use these configs, you first need to clone this repository in your `$HOME` directory:
```shell
git clone https://github.com/risangbaskoro/dotfiles.git
```

Then, you will need to have a CLI tool called [`stow`](https://www.gnu.org/software/stow/). You can install it via your favorite package manager.

```shell
brew install stow  # For macOS using Homebrew
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
