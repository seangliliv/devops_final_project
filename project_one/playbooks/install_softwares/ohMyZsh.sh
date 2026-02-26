#!/bin/bash

##Task: 
###Creating the shellscript in order to automate the installation process of OMZ on ubuntu machine. 
###When install the OMZ there should be two plugins configured : 
###1. Syntax Highlighting 
###2. Autosuggestions 


# # This script updates the package lists and upgrades installed packages,
sudo apt update && sudo apt upgrade -y

# # then installs Git and Curl if they are not already installed.
sudo apt install git curl -y

# # Next, it checks if Zsh is installed; if not, it installs Zsh.
if ! command -v zsh &> /dev/null
then
    sudo apt install zsh -y
    printf "Zsh installed successfully.\n"
fi

# then install Oh my zsh using the official installation script.
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Go to home directory
cd ~
# Continue commands...
echo "Now I am in: $(pwd)"

# After that, it clones the syntax highlighting and autosuggestions plugins into the appropriate Oh My Zsh custom plugins directory.
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git -y clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins# then install Oh my zsh using the official installation script.
if git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"; then
    echo "zsh-autosuggestions installed successfully!"
else
    echo "ERROR: Failed to clone zsh-autosuggestions"
    echo "Trying alternative method..."
    # Try removing and cloning again
    rm -rf "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"; then
    echo "zsh-syntax-highlighting installed successfully!"
else
    echo "ERROR: Failed to clone zsh-syntax-highlighting"
    echo "Trying alternative method..."
    # Try removing and cloning again
    rm -rf "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Update .zshrc to enable the plugins
if [ -f "/home/vagrant/.zshrc" ]; then
    sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "/home/vagrant/.zshrc"
fi



source ~/.zshrc