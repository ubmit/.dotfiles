#!/bin/sh

echo "Installing Homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding taps..."
brew tap homebrew/cask-fonts
brew tap crescentrose/sunshine

echo "Installing macOS formulae..."
brew install bat
brew install diff-so-fancy
brew install elixir
brew install rust
brew install fish
brew install fnm
brew install fzf
brew install git
brew install neovim
brew install ripgrep
brew install starship
brew install tldr
brew install tmux
brew install tree
brew install yarn
brew install rbenv
brew install httpie
brew install sunshine
brew install wget

echo "Installing casks..."
brew cask install firefox
brew cask install 1password
brew cask install alfred
brew cask install dozer
brew cask install font-jetbrains-mono-nerd-font
brew cask install insomnia
brew cask install keepingyouawake
brew cask install keka
brew cask install kitty
brew cask install maccy
brew cask install rectangle
brew cask install postbird
brew cask install tunnelblick
brew cask install visual-studio-code-insiders
brew cask install slack
brew cask install discord
brew cask install spotify
