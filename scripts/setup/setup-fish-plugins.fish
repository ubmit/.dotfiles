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
fisher install danhper/fish-ssh-agent