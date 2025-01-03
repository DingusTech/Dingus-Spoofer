# Dingus Spoofer

**Dingus Spoofer** is a simple script to spoof your MAC address on macOS. It allows you to generate random MAC addresses or manually set one for your network interface, making it easy to anonymize your device.

---

## Features
- Generate random valid MAC addresses.
- Manually set your desired MAC address.
- Automatically disable and re-enable Wi-Fi to apply changes.

---

## Installation

To install Dingus Spoofer, follow these steps:

1. Clone the repository:  
   `git clone https://github.com/DingusTech/Dingus-Spoofer.git`

2. Navigate to the directory:  
   `cd Dingus-Spoofer`

3. Make the installation script executable:  
   `chmod +x install.sh`

4. Run the installer:  
   `sudo ./install.sh`

5. Verify the installation:  
   `sudo spoofmac.sh`

---

## Usage

To use Dingus Spoofer, run:  
`sudo spoofmac.sh`  

Then, choose an option from the menu:  
1. Use a randomly generated MAC address.  
2. Generate a new random MAC address.  
3. Manually input a MAC address.  
4. Exit the script without making changes.

---

## Troubleshooting

If the script does not work as expected:  
1. Ensure the script is installed correctly:  
   `ls -l /usr/local/bin/spoofmac.sh`  

2. If the script is missing or not working, rerun the installation process:  
   `cd Dingus-Spoofer && sudo ./install.sh`

---

## Uninstallation

To remove the script, delete it from the `/usr/local/bin` directory:  
`sudo rm /usr/local/bin/spoofmac.sh`  

Optionally, remove the repository folder:  
`rm -rf Dingus-Spoofer`

---

## License

This project is licensed under the Creative Commons Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0). Proper attribution is required for use and distribution.

---

## Disclaimer

Dingus Spoofer is intended for educational and lawful purposes only. Dingus Tech nor any contributors are responsible for any misuse of this tool.

---

## Repository

Find the latest version of Dingus Spoofer and updates on GitHub:  
[https://github.com/DingusTech/Dingus-Spoofer](https://github.com/DingusTech/Dingus-Spoofer)
