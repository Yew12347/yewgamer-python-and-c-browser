# install.sh
#!/bin/bash

# Update package list and upgrade existing packages
sudo apt-get update && sudo apt-get upgrade -y

# Add necessary repositories
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted

# Update package list again
sudo apt-get update

# Install dependencies including Flatpak
sudo apt-get install -y build-essential python3 python3-tk flatpak

# Add the Flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install WebKitGTK via Flatpak
sudo flatpak install flathub org.webkit.WebKitGtk -y
