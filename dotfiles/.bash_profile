# ===[ Load the regular .bashrc configurations ]===
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
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

# Load the Rust toolchain into PATH
PATH="$HOME/.cargo/env:$PATH"
PATH="$HOME/.local/bin:$PATH"
