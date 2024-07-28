# install.sh
#!/bin/bash

# Update package list and upgrade existing packages
sudo apt-get update && sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y build-essential python3 python3-tk git cmake ninja-build libgtk-3-dev

# Clone WebKitGTK
git clone https://github.com/WebKit/WebKit.git
cd WebKit

# Install additional dependencies for WebKitGTK
Tools/Scripts/update-webkitgtk-libs

# Build WebKitGTK
Tools/Scripts/build-webkit --gtk
