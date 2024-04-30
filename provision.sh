#!/bin/bash

if [ "$EUID" -eq 0 ]
then
    echo "Please do not run this script as root. Switch to a non-root user, or remove sudo from your script invocation."
    exit
fi

HOME="/home/$(whoami)"

# Create the .config folder if one doesn't already exist. 
if [ ! -d ~/.config ]; then
    echo "No .config directory found; Creating one in the user's home directory."
    mkdir ~/.config;
fi

# Create the Applications folder in the user's home directory if one doesn't already exist.
if [ ! -d "$HOME/Applications" ]; then
    echo "No Applications directory found; Creating one in the user's home directory."
    mkdir "$HOME/Applications"
fi


# Create links of the dotfiles in their correct locations (Create parent folders if they don't exist).
# Vim
if [ -f "$HOME/.config/.vimrc" ]; then
    read -rp "A .vimrc file already exists; Would you like to overwrite it? [y/n]: " confirm 
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	rm "$HOME/.config/.vimrc"
	ln "./dotfiles/vim/.vimrc" "$HOME/.config/.vimrc"
    else
	echo "Leaving the pre-existing .vimrc alone."
    fi
else
    ln "./dotfiles/vim/.vimrc" "$HOME/.config/.vimrc"
fi

# Bash
if [ -f "$HOME/.config/.bashrc" ]; then
    # .bashrc files are sacred; Don't bloody touch them without explicit permission.
    # If this script is being used, it's likely that the pre-existing .bashrc is just the distro default.
    read -rp "A .bashrc file already exists; Would you like to overwrite it? [y/n]: " confirm 
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	rm "$HOME/.config/.bashrc"
	ln "./dotfiles/bash/.bashrc" "$HOME/.config/.bashrc"
    else
	echo "Leaving the pre-existing .bashrc alone."
    fi
else
    ln "./dotfiles/bash/.bashrc" "$HOME/.config/.bashrc"
fi

if [ -f "$HOME/.bash_profile" ]; then
    read -rp "A .bash_profile file already exists; Would you like to overwrite it? [y/n]: " confirm 
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	rm "$HOME/.bash_profile"
	ln "./dotfiles/.bash_profile" "$HOME/.bash_profile"
    else
	echo "Leaving the pre-existing .bash_profile alone."
    fi
else
    ln "./dotfiles/.bash_profile" "$HOME/.bash_profile"
fi

if [ -f "$HOME/.ps1_prompt" ]; then
    read -rp "A .ps1_prompt file already exists; Would you like to overwrite it? [y/n]: " confirm 
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	rm "$HOME/.config/.ps1_prompt"
	ln "./dotfiles/bash/.ps1_prompt" "$HOME/.config/.ps1_prompt"
    else
	echo "Leaving the pre-existing .ps1_prompt alone."
    fi
else
    ln "./dotfiles/bash/.ps1_prompt" "$HOME/.config/.ps1_prompt"
fi


# Htop
if [ ! -d "$HOME/.config/htop" ]; then
  mkdir "$HOME/.config/htop";
fi
if [ -f "$HOME/.config/htop/htoprc" ]; then
    read -rp "A htoprc file already exists; Would you like to overwrite it? [y/n]: " confirm 
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	rm "$HOME/.config/htop/htoprc"
	ln "./dotfiles/htop/.htoprc" "$HOME/.config/htop/htoprc"
    else
	echo "Leaving the pre-existing .htoprc alone."
    fi
else
    ln "./dotfiles/htop/.htoprc" "$HOME/.config/htop/htoprc"
fi



# Install NeoVim (If not already present)
# Clone the config repo
if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Downloading the nvim config from GitHub..."
    git clone https://github.com/Dalemaunder/nvim.git "$HOME/.config/nvim"
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

# Move the appimage to the user's home Applications folder and make it executable.
echo "Installing the appimage..."
mv "nvim.appimage" "$HOME/Applications/nvim"
chmod +x "$HOME/Applications/nvim"

echo "Done. Remember to run \"source $HOME/.bash_profile\" for the current shell session."
