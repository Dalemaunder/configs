# Aliases
# My preference for ls behaviour
alias ls="ls -lahAFg --color=auto"
# Color on IP commands
alias ip="ip -c"
# Convenient backwards navigation in fs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# Get public IP (v4 and v6)
alias whatismyip="curl ipv4.icanhazip.com ; curl ipv6.icanhazip.com"
# Use grep flags instead of deprecated utils
alias egrep="grep -E"
alias frep="grep -F"

# Exports:
# Set vim to always be the default editor
export EDITOR="vim" 
# Proper terminal colours
export TERM=xterm-256color

export HISTCONTROL=ignoreboth:erasedups

# Loads the script for the advanced PS1 prompt (Git integration) if it exists, else it loads the base custom prompt.
if [ -f ~/.ps1_prompt ]; then
	. ~/.ps1_prompt
else
	PS1="\[\033[38;5;196m\][\[$(tput sgr0)\]\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;112m\]@\[$(tput sgr0)\]\[\033[38;5;31m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;163m\]\w\[$(tput sgr0)\]\[\033[38;5;196m\]]\[$(tput sgr0)\]"
fi
