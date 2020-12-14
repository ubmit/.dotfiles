#!/bin/bash

echo "Setting fish as the default shell..."
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
