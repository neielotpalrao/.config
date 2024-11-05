#!/bin/sh
# This script is to load the minimal config which includes only nvim right now.

# install nvim
# curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
# tar xzf nvim-macos-arm64.tar.gz
# ./nvim-macos-arm64/bin/nvim
#

# Set variables
NEOVIM_VERSION="stable"
CONFIG_REPO="your-github-repo-url"
CONFIG_BRANCH="main"

# Create necessary directories
mkdir -p ~/.config/nvim

# Clone Neovim repository
git clone https://github.com/neovim/neovim.git ~/nvim

# Change directory to Neovim
cd ~/nvim

# Checkout the desired version
git checkout $NEOVIM_VERSION

# Build Neovim
make CMAKE_BUILD_TYPE=Release

# Install Neovim
sudo make install

# Clone your config repository
git clone $CONFIG_REPO ~/.config/nvim

# Navigate to the config directory
cd ~/.config/nvim

# Checkout the desired branch
git checkout $CONFIG_BRANCH

# Create symlinks for config files
ln -sf $(pwd)/init.vim ~/.config/nvim/init.vim
ln -sf $(pwd)/plugins.lua ~/.config/nvim/plugins.lua

# Error handling
set -e

# Cleanup
rm -rf ~/nvim

echo "Neovim installation completed successfully!"
