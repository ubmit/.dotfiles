#!/bin/bash

echo "Installing vim-plug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing Python 2 and Python 3 providers..."
curl https://bootstrap.pypa.io/get-pip.py -o $HOME/get-pip.py
python get-pip.py
rm $HOME/get-pip.py

python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

echo "Installing Ruby provider..."
rbenv install 2.7.2
rbenv global 2.7.2

echo "Installing Node.js provider..."
yarn global add neovim
