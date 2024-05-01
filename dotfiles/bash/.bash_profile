# ===[ Load the regular .bashrc configurations ]===
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# ===[ Auto-run programs ]===
# Automatically load autojump on login if available.
if [ "$(command -v /usr/share/autojump/autojump.sh)" ]; then
    . /usr/share/autojump/autojump.sh
fi

# Automatically run neofetch on login if available.
if [ "$(command -v neofetch)" ]; then
    neofetch
fi


# ===[ Exports ]===
# Set the EDITOR variable depending on available packages.
if [ "$(command -v nvim)" ]; then
    export EDITOR="nvim"
elif [ "$(command -v vim)" ]; then
    export EDITOR="vim"
else
    export EDITOR="vi"
fi

# Proper terminal colours.
export TERM=xterm-256color

# Remove duplicates from bash history.
export HISTCONTROL=ignoreboth:erasedups
. "$HOME/.cargo/env"
