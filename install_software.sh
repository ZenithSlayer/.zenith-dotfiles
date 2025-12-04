#!/bin/bash

# Go to home
cd ~

# Install Yay
echo "Installing Yay..."
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~

# Update the system
echo "Updating system..."
yay -Syu --noconfirm

# Install preferred software
echo "Installing preferred software..."
yay -S --noconfirm kitty code steam starship stow

# Remove unwanted software
echo "Removing unwanted software..."
yay -Rns --noconfirm konsole

# Finish installation
echo "Installation complete. All done!"

# Config with Stow
echo "Putting Configs in their places..."
cd ~/.zenith-Dotfiles
stow --override .

# Clean up
echo "Removing all downloaded repos..."
sudo rm -rf ~/yay