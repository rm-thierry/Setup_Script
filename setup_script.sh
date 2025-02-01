#!/bin/bash

echo "Setup will begin now"

if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    OS=$NAME
    VERSION=$VERSION_ID
    echo "You are using $OS version $VERSION"

    if [[ $OS == "Ubuntu" || $OS == "Debian" ]]; then
        echo "Updating package list"
        sudo apt-get update
        echo "Upgrading packages"
        sudo apt-get upgrade -y
        echo "Installing git"
        sudo apt-get install git -y
        echo "Installing curl"
        sudo apt-get install curl -y
        echo "Installing zsh"
        sudo apt-get install zsh -y
        echo "Installing vim"
        sudo apt-get install vim -y
        echo "Installing tmux"
        sudo apt-get install tmux -y
        echo "Installing htop"
        sudo apt-get install htop -y
        echo "Installing neofetch"
        sudo apt-get install neofetch -y
    else
        echo "Unsupported OS"
    fi
else
    echo "Unsupported OS"
fi
