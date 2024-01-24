#!/bin/bash

# Quit early if the user is not root/sudo.
if [ "$EUID" -ne 0 ]
  then echo "This script installs packages; Please run with sudo."
  exit
fi

echo "Installing packages"
add-apt-repository universe
apt-get update
apt-get install git -y
apt-get install wget -y
apt-get install curl -y
apt-get install libfuse2 -y
