#!/bin/bash

# Define the source and destination for the spoofmac script
SOURCE_FILE="spoofmac.sh"
DEST_FILE="/usr/local/bin/spoofmac.sh"

# Check if the spoofmac.sh file exists in the current directory
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: $SOURCE_FILE not found in the current directory!"
    exit 1
fi

# Copy the spoofmac.sh script to /usr/local/bin to make it available system-wide
echo "Installing spoofmac.sh script to /usr/local/bin..."
sudo cp "$SOURCE_FILE" "$DEST_FILE"

# Check if the file was copied successfully
if [ ! -f "$DEST_FILE" ]; then
    echo "Error: Failed to copy $SOURCE_FILE to $DEST_FILE."
    exit 1
fi

# Make the script executable
echo "Making spoofmac.sh executable..."
sudo chmod +x "$DEST_FILE"

# Verify the installation by checking if the file is executable
if [ -x "$DEST_FILE" ]; then
    echo "Installation successful! You can now use spoofmac.sh by typing 'sudo spoofmac.sh' in the terminal."
else
    echo "Error: Failed to make $DEST_FILE executable."
    exit 1
fi
