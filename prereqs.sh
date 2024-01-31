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

