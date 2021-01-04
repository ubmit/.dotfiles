# load aliases
. $HOME/.config/fish/aliases.fish

# load starship
starship init fish | source

# load fish_ssh_agent
fish_ssh_agent

# load asdf
source ~/.asdf/asdf.fish

# add $HOME/.local/bin to PATH
set PATH $HOME/.local/bin $PATH

# add python scripts location to PATH
set PATH $HOME/Library/Python/2.7/bin $PATH

# add oly to PATH
set PATH $HOME/.oly/bin $PATH

# set empty greeting
set fish_greeting

# set vi key bindings
fish_vi_key_bindings

# set FZF_DEFAULT_COMMAND 
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'
