# Tmux Plugin Manager (tpm)
TPM_HOME="${XDG_DATA_HOME:-${HOME}}/.tmux/plugins/tpm"

# Check if tpm exists
if [ ! -d "$TPM_HOME" ]; then
	mkdir -p "$(dirname $TPM_HOME)"
	git clone https://github.com/tmux-plugins/tpm.git "$TPM_HOME"
fi

# Function to get the current Git branch name
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/^\*/s/^\* //p'
}

# Color definitions (using ANSI escape sequences)
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
RESET='\[\033[0m\]'

# Set custom PS1
export PS1="\n${RED}$(whoami) ${BLUE}\w$(printf '\t')${GREEN}\$(parse_git_branch)${RESET}\n${GREEN}❯${RESET} "

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
