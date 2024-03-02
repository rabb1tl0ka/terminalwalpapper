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

echo "dependencies.sh > checking python3.11-venv availability"
if apt show python3.11-venv &>/dev/null; then
    echo "dependencies.sh > installing python3.11-venv"
    apt install -y python3.11-venv
else
    echo "dependencies.sh > python3.11-venv not available, falling back to python3-venv"
    apt install -y python3-venv
fi

echo "dependencies.sh > creating a python3 virtual environment"
python3 -m venv .venv

echo "dependencies.sh > activating the venv"
source .venv/bin/activate

echo "dependencies.sh > installing pywal"
python3 -m pip install pywal

