#!/usr/local/bin/fish

echo "Installing Fisher, a plugin manager..."
curl -sL https://git.io/fisher | source

echo "Installing plugins from fish_plugins file..."
fisher update

echo "Adding ~/.ssh/environment file for fish-ssh-agent plugin..."
touch ~/.ssh/environment