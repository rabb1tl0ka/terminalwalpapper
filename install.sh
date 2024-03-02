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