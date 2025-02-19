# Tmux Plugin Manager (tpm)
TPM_HOME="${XDG_DATA_HOME:-${HOME}}/.tmux/plugins/tpm"

# Check if tpm exists
if [ ! -d "$TPM_HOME" ]; then
	mkdir -p "$(dirname $TPM_HOME)"
	git clone https://github.com/tmux-plugins/tpm.git "$TPM_HOME"
fi

# Enable colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Git branch function
parse_git_branch() {
  git branch 2>/dev/null | grep '*' | sed 's/* //'
}

# Set custom PS1
export PS1="\[\e[34m\] \[\e[36m\]\w \[\e[32m\] \$(parse_git_branch) \[\e[32m\]\n❯ "

# History
# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# Don't store duplicate adjacent items in the history
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'

# Auto change directory (cd)
shopt -s autocd

# Enable cdspell
shopt -s cdspell

# Default Editor
# Preferred editor for local and remote sessions
if which nvim > /dev/null 2>&1; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Aliases
if [ -f $HOME/.shell_aliases ]; then
  source $HOME/.shell_aliases
fi
