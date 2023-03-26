# Load the regular .bashrc configurations.
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

if [ -f ~/.bash_custom ]; then
        . ~/.bash_custom
fi

# Automatically load autojump on login.
. /usr/share/autojump/autojump.sh

# Automatically run neofetch on login.
neofetch
