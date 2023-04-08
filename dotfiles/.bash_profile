# ===[ Load the regular .bashrc configurations ]===
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

if [ -f ~/.bash_custom ]; then
        . ~/.bash_custom
fi

# ===[ Auto-run programs ]===
# Automatically load autojump on login.
if [ $(command -v /usr/share/autojump/autojump.sh) ]; then
    . /usr/share/autojump/autojump.sh
fi

# Automatically run neofetch on login.
if [ $(command -v neofetch) ]; then
    neofetch
fi
