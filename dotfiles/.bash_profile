# ===[ Load the regular .bashrc configurations ]===
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

if [ -f ~/.bash_custom ]; then
        . ~/.bash_custom
fi

# Loads the script for the advanced PS1 prompt (Git integration) if it exists, else it loads the base custom prompt.
if [ -f ~/.ps1_prompt ]; then
	. ~/.ps1_prompt
else
	PS1="\[\033[38;5;196m\][\[$(tput sgr0)\]\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;112m\]@\[$(tput sgr0)\]\[\033[38;5;31m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;163m\]\w\[$(tput sgr0)\]\[\033[38;5;196m\]]\[$(tput sgr0)\]"
fi



# ===[ Auto-run programs ]===
# Automatically load autojump on login.
. /usr/share/autojump/autojump.sh

# Automatically run neofetch on login.
neofetch
