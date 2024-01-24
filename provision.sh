#!/bin/bash

if [ "$EUID" -eq 0 ]
then
    echo "Please do not run this script as root. Switch to a non-root user, or remove sudo from your script invocation."
    exit
fi

HOME="/home/$(whoami)"

# Create the .config folder if it doesn't exist. 
if [ ! -d ~/.config ]; then
    echo "No .config directory found; Creating one in the user's home directory."
    mkdir -p ~/.config;
fi

# Create the Applications folder in the user's home directory if one doesn't already exist.
if [ ! -d "$HOME/Applications" ]; then
    echo "No Applications directory found; Creating one in the user's home directory."
    mkdir "$HOME/Applications"
fi

# Create symlinks of the dotfiles in their correct locations (Create parent folders if they don't exist).
# Vim
ln -s "./dotfiles/.vimrc" "$HOME/.vimrc"
# Bash
ln -s "./dotfiles/.bashrc" "$HOME/.bashrc"
ln -s "./dotfiles/.bash_profile" "$HOME/.bash_profile"
ln -s "./dotfiles/.ps1_prompt" "$HOME/.ps1_prompt"
# Htop
if [ ! -d "$HOME/.config/htop" ]; then
  mkdir -p "$HOME/.config/htop";
fi
ln -s "./dotfiles/.htoprc" "$HOME/.config/htop/htoprc"


# Install NeoVim (If not already present)
# Clone the config repo
if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/Dalemaunder/nvim.git "$HOME/.config/"
fi

# Download the latest version of the nvim appimage
echo "Attempting to download the latest NeoVim version..."
REPO="neovim/neovim"; \
    curl -s https://api.github.com/repos/${REPO}/releases/latest | grep "browser_download_url.*.appimage\"" \
    | head -1 \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget --show-progress -qi - \
    || echo "-> Could not download the latest version of '${REPO}' for your architecture."

echo "Installing the appimage..."
# Move the appimage to the user's home Applications folder and make it executable.
mv "nvim.appimage" "$HOME/Applications/nvim"
chmod +x "$HOME/Applications/nvim"


echo "Done."
