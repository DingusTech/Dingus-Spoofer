#!/bin/bash

# Make sure the script is being run with superuser privileges
if [ "$(id -u)" != "0" ]; then
    echo "You must run this script as root. Use sudo."
    exit 1
fi

# Define the source and destination locations
SOURCE_PATH="./spoofmac"  # Path to the spoofmac script in the repository
DEST_PATH="/usr/local/bin/spoofmac"  # Location to install the script

# Check if the spoofmac script exists
if [ ! -f "$SOURCE_PATH" ]; then
    echo "The script for Dingus Spoofer does not exist. Please make sure you're running the install script from the repository."
    exit 1
fi

# Copy the spoofmac script to /usr/local/bin
echo "Installing spoofmac..."
cp "$SOURCE_PATH" "$DEST_PATH"

# Make the script executable
chmod +x "$DEST_PATH"

# Verify the installation
if [ -f "$DEST_PATH" ]; then
    echo "spoofmac installed successfully!"
else
    echo "There was an error installing Dingus Spoofer."
    exit 1
fi
