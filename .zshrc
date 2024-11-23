# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Check if Zinit exists
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Tmux Plugin Manager (tpm)
TPM_HOME="${XDG_DATA_HOME:-${HOME}}/.tmux/plugins/tpm"

# Check if tpm exists
if [ ! -d "$TPM_HOME" ]; then
	mkdir -p "$(dirname $TPM_HOME)"
	git clone https://github.com/tmux-plugins/tpm.git "$TPM_HOME"
fi

# Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Source Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add snippets
# zinit snippet OMZP::aliases
zinit snippet OMZP::git
# zinit snippet OMZP::gh

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;9D" beginning-of-line
bindkey "^[[1;9C" end-of-line
bindkey "^[[3;10~" backward-kill-word
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
# Set bash word style to treat dir limiter as word
autoload -U select-word-style
select-word-style bash

# History
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Auto change directory (cd)
setopt autocd


# "take" command
# Implementing a trick from a blog post.
# See https://batsov.com/articles/2022/09/16/oh-my-zsh-fun-with-take/
# ----------------------------------------

# For directories
function mkcd takedir() {
  mkdir -p $@ && cd ${@:$#}
}

# For git urls
function takegit() {
  git clone "$1"
  cd "$(basename ${1%%.git})"
}

# The actual "take" command
# If it is a git url, it will clone the repository and cd to the directory
# else, create a directory and or cd to the directory
function take() {
  if [[ $1 =~ ^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?$ ]]; then
    takegit "$1"
  else
    takedir "$@"
  fi
}

# ----------------------------------------


# Default Editor
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Aliases
alias zshconfig='${EDITOR} ~/.zshrc'
alias restart='exec zsh'
alias als='alias | fzf --ansi --layout=reverse --border --height 50%'
alias ls='ls --color'
alias c='clear'
alias dotfiles='cd ~/dotfiles'

# Check if OS is Darwin (macOS)
if [[ $(uname) == "Darwin" ]]; then
  alias safari='open /Applications/Safari.app'
fi

# Alias to change Alacritty theme
alias alatheme="ls ~/.config/alacritty/themes | fzf --ansi --layout=reverse --border --height 50% | xargs -I {} ln -sf ~/.config/alacritty/themes/{} ~/.config/alacritty/current-theme.toml && echo '@@@' >> ~/.config/alacritty/alacritty.toml && sed '/@@@/d' ~/.config/alacritty/alacritty.toml > ~/.config/alacritty/alacritty.tmp && mv ~/.config/alacritty/alacritty.tmp ~/.config/alacritty/alacritty.toml"

# Shell integrations
eval "$(fzf --zsh)"
