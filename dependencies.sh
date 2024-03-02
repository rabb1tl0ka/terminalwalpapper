#!/bin/bash

# Check if the script is being run with sudo/root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run the script with sudo or as root."
    exit 1
fi

echo "updating apt"
apt update

echo "installing python3-pip"
apt install -y python3-pip

echo "Install pywal using pip3"
pip3 install pywal

echo "Dependencies installed successfully."
