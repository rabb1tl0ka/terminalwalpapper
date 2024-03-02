#!/bin/bash

# Set the file to be moved
wal_config="wal.desktop"

# Set the destination directory
autostart_dir="$HOME/.config/autostart"

# Create autostart directory if it doesn't exist
if [ ! -d "$autostart_dir" ]; then
    mkdir -p "$autostart_dir"
fi

# Move the file to autostart directory with user prompt for overwriting
mv -i "$wal_config" "$autostart_dir/"

# We need to add the code inside this file
#  to the end of the ~/.bashrc file
code_file="bashrc_code.txt"

# Check if the file exists
if [ ! -f "$code_file" ]; then
    echo "Error: Code file not found: $code_file"
    exit 1
fi

# Read the code from the file
code_to_add=$(<"$code_file")

# Backup the original ~/.bashrc
backup_file="bashrc_original"
cp ~/.bashrc "$backup_file"
echo "Backup of ~/.bashrc created: $backup_file"

# Check if the code is already present in ~/.bashrc
if grep -q "$code_to_add" ~/.bashrc; then
    echo "Code is already present in ~/.bashrc. No changes made."
    echo "Removing the backup bashrc file"
    rm $backup_file"
else
    # Append the code to the end of ~/.bashrc
    echo -e "\n$code_to_add" >> ~/.bashrc
    echo "Code added to ~/.bashrc successfully."
fi