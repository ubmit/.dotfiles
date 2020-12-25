#!/usr/local/bin/fish

echo "Installing Fisher, a plugin manager..."
curl -sL https://git.io/fisher | source
fisher install jorgebucaran/fisher

echo "Installing some plugins with Fisher..."
fisher install jethrokuan/z
fisher install jethrokuan/fzf
fisher install franciscolourenco/done
fisher install joseluisq/gitnow@2.5.1
fisher install laughedelic/pisces
fisher install laughedelic/fish_logo
fisher install jhillyerd/plugin-git

echo "Installing plugins that aren't available through Fisher..."
wget https://gitlab.com/kyb/fish_ssh_agent/raw/master/functions/fish_ssh_agent.fish -P ~/.config/fish/functions/
