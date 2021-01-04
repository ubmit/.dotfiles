#!/bin/bash

echo "Adding the plugins..."
asdf plugin add elixir
asdf plugin add ruby
asdf plugin add python
asdf plugin add rust
asdf plugin add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

echo "Installing the versions defined at ~/.tool-versions..."
asdf install
