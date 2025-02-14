#!/bin/bash

echo "Setup will begin now"


//Functions

install_package() {
    local package=$1
    echo "Installing $package"
    sudo apt-get install "$package" -y &
    local pid=$!
    wait $pid

    if [ $? -ne 0 ]; then
        echo "Error: $package could not be installed."
    else
        echo "$package installed successfully."
    fi
}

configure(){
    if [[ -f ~/.vimrc ]]; then
        echo "Configure"
    else
        touch ~/.vimrc
    fi
    echo "asdasdasdasd"
}




// Main

if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    OS=$NAME
    VERSION=$VERSION_ID
    echo "You are using $OS version $VERSION"

    if [[ $OS == *"Ubuntu"* || $OS == *"Debian"* ]]; then
        echo "Updating package list"
        sudo apt-get update -y &
        echo "Upgrading packages"
        sudo apt-get upgrade -y &

        install_package git
        install_package curl
        install_package zsh
        install_package vim
        install_package tmux
        install_package htop
        install_package neofetch
    else
        echo "Unsupported OS"
    fi
else
    echo "Unsupported OS"
fi

configure;
