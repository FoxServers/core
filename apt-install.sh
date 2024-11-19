#!/bin/sh
if apt; then
    echo "Updating apt packages..."
    sudo apt update -y
    sudo apt upgrade -y
    echo "Installing samba..."
    sudo apt install samba -y
    echo "Installing python..."
    sudo apt install python3 -y
    echo "Installing docker-compose..."
    sudo apt install docker-compose -y
    echo "Done!"
fi
