#!/bin/bash

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
RESET='\033[0m'

# Start installation
echo -e "${CYAN}Starting the Dingus Spoofer installation process...${RESET}"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Error: This script must be run as root. Use 'sudo ./install.sh'.${RESET}"
    exit 1
fi

# Copy script to /usr/local/bin
echo -e "${YELLOW}Copying the spoofmac.sh script to /usr/local/bin...${RESET}"
cp spoofmac.sh /usr/local/bin/spoofmac.sh

# Make it executable
echo -e "${YELLOW}Setting executable permissions...${RESET}"
chmod +x /usr/local/bin/spoofmac.sh

# Verify installation
if [[ -f /usr/local/bin/spoofmac.sh ]]; then
    echo -e "${GREEN}Installation successful!${RESET}"
    echo -e "${BLUE}You can now use Dingus Spoofer by running:${RESET} ${MAGENTA}sudo spoofmac.sh${RESET}"
else
    echo -e "${RED}Error: The installation failed. Please check your permissions and try again.${RESET}"
    exit 1
fi
