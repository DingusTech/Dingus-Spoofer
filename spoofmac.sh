#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (use sudo)." >&2
    exit 1
fi

# Function to generate a valid random MAC address
generate_mac() {
    printf '%02x:%02x:%02x:%02x:%02x:%02x\n' \
        $((RANDOM % 256)) \
        $((RANDOM % 256)) \
        $((RANDOM % 256)) \
        $((RANDOM % 256)) \
        $((RANDOM % 256)) \
        $((RANDOM % 256))
}

# Prompt the user for action
while true; do
    echo
    echo "Options:"
    echo "1) Use a randomly generated MAC address"
    echo "2) Manually enter a MAC address"
    echo "3) Exit"
    read -rp "Choose an option [1-3]: " option

    case $option in
        1)
            NEW_MAC=$(generate_mac)
            echo "Using randomly generated MAC address: $NEW_MAC"
            break
            ;;
        2)
            read -rp "Enter the MAC address you want to use (format xx:xx:xx:xx:xx:xx): " NEW_MAC
            if [[ $NEW_MAC =~ ^([0-9a-f]{2}:){5}[0-9a-f]{2}$ ]]; then
                echo "Using manually entered MAC address: $NEW_MAC"
                break
            else
                echo "Invalid MAC address format. Please try again."
            fi
            ;;
        3)
            echo "Exiting without spoofing MAC address."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose again."
            ;;
    esac
done

# Disable Wi-Fi
echo "Turning off Wi-Fi on en0..."
networksetup -setairportpower en0 off
if [ $? -ne 0 ]; then
    echo "Failed to disable Wi-Fi. Exiting."
    exit 1
fi

# Spoof the MAC address using the spoof-mac tool
echo "Setting new MAC address to $NEW_MAC..."
sudo spoof-mac set "$NEW_MAC" en0
if [ $? -ne 0 ]; then
    echo "Failed to set MAC address. Exiting."
    exit 1
fi

# Re-enable Wi-Fi
echo "Turning on Wi-Fi on en0..."
networksetup -setairportpower en0 on
if [ $? -ne 0 ]; then
    echo "Failed to enable Wi-Fi. Exiting."
    exit 1
fi

# Confirm success
echo "MAC address spoofed successfully to $NEW_MAC."
