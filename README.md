# MAC Spoofer

A simple script to spoof your MAC address on macOS. This script allows you to generate random MAC addresses or manually set one for your network interface.

---

## Features
- Randomly generate valid MAC addresses.
- Manually enter your desired MAC address.
- Automatically disable and re-enable Wi-Fi to apply changes.

---

## Installation

Follow these steps to install the `spoofmac` command on your system:

1. Clone this repository to your computer. To do this, go to the repository page on GitHub, copy the repository link, and use the `git clone` command. After cloning, navigate into the folder using the `cd` command.

2. Run the installer script to set up the `spoofmac` command on your system. You must use `sudo` since the installer needs root permissions to place the file in `/usr/local/bin`.

3. Once the installer has completed, you can run the command `sudo spoofmac` to use the script.

If you encounter any issues, double-check that the script was correctly installed in `/usr/local/bin` and that it has executable permissions.

---

## Usage

To spoof your MAC address, simply run the command `sudo spoofmac`. The script will guide you through the process with the following options:

1. Generate and use a random MAC address.
2. Manually enter a MAC address.
3. Exit the script without making any changes.

---

## Uninstallation

If you wish to remove the `spoofmac` script, delete it from `/usr/local/bin` using the following command:

`sudo rm /usr/local/bin/spoofmac`

---

## License

This project is licensed under the MIT License. You are free to use and share the script but must provide attribution.

---

## Disclaimer

This script is for educational purposes only. The author is not responsible for any misuse of this tool.
