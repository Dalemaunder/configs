#!/bin/bash

# Quit early if the user is not root/sudo.
if [ "$EUID" -ne 0 ]
  then echo "This script installs packages; Please run with sudo."
  exit
fi

echo "Installing packages..."
add-apt-repository universe -y
apt-get update && apt-get upgrade -y
apt-get install git -y
apt-get install wget -y
apt-get install curl -y
apt-get install libfuse2 -y
apt-get install gcc -y
echo -e "\n"
echo "Mandatory packages have been installed."

echo -e "\n"
read -rp "Would you like to install desirable optional packages? [y/n]" confirm 
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	apt-get install ncdu -y
	apt-get install htop -y
    else
	echo "Skipping non-mandatory packages."
    fi


echo -e "\n"
read -rp "Would you like to install the sway wm? [y/n]" confirm 
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	apt-get install sway swaylock swayidle waybar -y
    else
	echo "Skipping sway installation."
    fi


echo -e "\n"
read -rp "Would you like to install Rustlang? [y/n]" confirm 
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    else
	echo "Skipping Rust installation."
    fi
