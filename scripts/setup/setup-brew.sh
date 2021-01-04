#!/bin/bash

echo "Installing Homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding taps..."
brew tap homebrew/cask-fonts

echo "Installing macOS formulae..."
brew install bat
brew install fish
brew install fzf
brew install git
brew install neovim
brew install ripgrep
brew install starship
brew install tldr
brew install tmux
brew install tree
brew install yarn
brew install httpie
brew install wget
brew install cmake
brew install qmk/qmk/qmk
brew install git-delta

echo "Installing casks..."
brew install --cask docker
brew install --cask firefox
brew install --cask 1password
brew install --cask alfred
brew install --cask dozer
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask insomnia
brew install --cask keepingyouawake
brew install --cask keka
brew install --cask kitty
brew install --cask maccy
brew install --cask rectangle
brew install --cask postbird
brew install --cask visual-studio-code-insiders
brew install --cask slack
brew install --cask discord
brew install --cask spotify
brew install --cask via
