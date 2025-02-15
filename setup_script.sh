#!/bin/bash

if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    OS=$NAME
    VERSION=$VERSION_ID
    echo "You are using $OS version $VERSION"
else
    echo "Unsupported OS"
    exit 1
fi

echo "Setup will begin now"

install_package(){
    local package=$1
    echo "Installing $package"
    sudo apt-get install "$package" -y

    if [ $? -ne 0 ]; then
        echo "Error: $package could not be installed."
    else
        echo "$package installed successfully."
    fi
}

configure(){
    cp ./config/.vimrc ~/
}

install_java(){
    if ! java --version | grep -q "21"; then
        echo "Installing Java 21..."
        wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
        sudo dpkg -i jdk-21_linux-x64_bin.deb
        sudo apt-get install -f -y
    else
        echo "Java 21 is already installed."
    fi
}

if [[ $OS == *"Debian"* || $OS == *"Ubuntu"* ]]; then
    echo "Updating package list"
    sudo apt-get update -y
    echo "Upgrading packages"
    sudo apt-get upgrade -y

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

configure
install_java

echo "Operating system: $OS"
