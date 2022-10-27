#!/bin/bash

cd ~/Downloads/

# vscode .deb package 64-bit
wget --content-disposition https://go.microsoft.com/fwlink/?LinkID=760868
sudo apt install `ls -1 -t code_*.deb* | head -n 1`

# "Open in Code"
wget -qO- https://raw.githubusercontent.com/anniehastur450/ubuntu-fresh-startup/master/code-install.sh | bash

# nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
