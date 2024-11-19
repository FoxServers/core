#!/bin/sh
if apt; then
    echo "Updating apt packages..."
    sudo apt update && sudo apt upgrade
    echo "Installing samba..."
    sudo apt install samba
    echo "Installing python..."
    sudo apt install python3
    echo "Installing docker-compose..."
    sudo apt install docker-compose
    echo "Done!"
fi
