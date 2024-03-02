#!/bin/bash

# Check if the script is being run with sudo/root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run the script with sudo or as root."
    exit 1
fi

echo "dependencies.sh > updating apt"
apt update

echo "dependencies.sh > installing pre-requirements"
apt install -y python3-pip
apt install python3.11-venv

echo "dependencies.sh > creating a python3 virtual environment"
python3 -m venv .venv

echo "dependencies.sh > activating the venv"
source .venv/bin/activate

echo "dependencies.sh > installing pywal"
python3 -m pip install pywal

