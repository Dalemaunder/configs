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

# Loads the script for the advanced PS1 prompt (Git integration) if it exists, else it loads the base custom prompt.
if [ -f ~/.ps1_prompt ]; then
	. ~/.ps1_prompt
else
	PS1="\[\033[38;5;196m\][\[$(tput sgr0)\]\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;112m\]@\[$(tput sgr0)\]\[\033[38;5;31m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;163m\]\w\[$(tput sgr0)\]\[\033[38;5;196m\]]\[$(tput sgr0)\]"
fi

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi


# Load programming toolchains into PATH
# Rust
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
# Zig
PATH="$HOME/.zig/:$PATH"

# I don't remember what these are; Commenting out until something yells at me.
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load the Applications directory into the path; Used for appimages, etc.
PATH="$HOME/Applications:$PATH"
. "$HOME/.cargo/env"
