#!/bin/bash

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
RESET='\033[0m' # Reset color

# Function to display the menu
display_menu() {
    echo -e "${CYAN}Options:${RESET}"
    echo "1) Use a randomly generated MAC address"
    echo "2) Generate a new random MAC address"
    echo "3) Manually enter a MAC address"
    echo "4) Exit"
    echo -n "Choose an option [1-4]: "
}

# Function to generate a random MAC address
generate_random_mac() {
    echo $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/:$//')
}

# Function to spoof the MAC address
spoof_mac() {
    local mac_address=$1
    echo -e "${YELLOW}Checking the status of en0 before changing the MAC address...${RESET}"
    ifconfig en0

    echo -e "${CYAN}Disabling the network interface...${RESET}"
    networksetup -setairportpower en0 off

    # Run the spoofing command
    echo -e "${CYAN}Spoofing MAC address to ${mac_address}...${RESET}"
    if sudo ifconfig en0 ether "$mac_address"; then
        echo -e "${GREEN}MAC address spoofed successfully to ${mac_address}.${RESET}"
    else
        echo -e "${RED}Failed to spoof MAC address. Exiting.${RESET}"
        networksetup -setairportpower en0 on
        exit 1
    fi

    # Re-enable the network interface
    echo -e "${CYAN}Re-enabling the network interface...${RESET}"
    networksetup -setairportpower en0 on
}

# Main script logic
while true; do
    display_menu
    read -r choice

    case $choice in
        1)
            mac_address=$(generate_random_mac)
            echo -e "${YELLOW}Using randomly generated MAC address: ${mac_address}${RESET}"
            spoof_mac "$mac_address"
            break
            ;;
        2)
            mac_address=$(generate_random_mac)
            echo -e "${YELLOW}Generated a new random MAC address: ${mac_address}${RESET}"
            spoof_mac "$mac_address"
            break
            ;;
        3)
            echo -n "Enter the MAC address you want to spoof: "
            read -r mac_address
            spoof_mac "$mac_address"
            break
            ;;
        4)
            echo -e "${CYAN}Exiting the script. Goodbye!${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Please try again.${RESET}"
            ;;
    esac
done
