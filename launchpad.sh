#! /bin/sh

# Update all packages
sudo apt-get update && \
sudo apt-get upgrade -y

# Install ZSH and Oh My ZSH
sudo apt-get install zsh -y && \
chsh -s $(which zsh) && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended

# Install Starship.RS
yes | sh -c "$(curl -sS https://starship.rs/install.sh)"

# Install batcat
sudo apt-get install bat -y

# Config setup
mkdir ~/.config -p && cp ./.config/starship.toml ~/.config/starship.toml
cp ./.aliases ~/.aliases
cat ./.zshrc_extra >> ~/.zshrc

# Finalization
read -p "Ready to launch, press any key to GO!" DISCARD
zsh
