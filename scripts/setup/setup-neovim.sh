#!/bin/bash

echo "Installing Python 2 and Python 3 providers..."
curl https://bootstrap.pypa.io/get-pip.py -o $HOME/get-pip.py
python2 $HOME/get-pip.py
python3 $HOME/get-pip.py
rm $HOME/get-pip.py

python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

echo "Installing Node.js provider..."
yarn global add neovim

echo "Installing Ruby provider..."
gem install neovim
