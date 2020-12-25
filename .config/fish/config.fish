# load aliases
. $HOME/.config/fish/aliases.fish

# load starship
starship init fish | source

# load fnm
fnm env --use-on-cd --shell=fish | source

# load rbenv
status --is-interactive; and source (rbenv init -|psub)

# load fish_ssh_agent
fish_ssh_agent

# add $HOME/.local/bin to PATH
set PATH $HOME/.local/bin $PATH

# add python scripts location to PATH
set PATH $HOME/Library/Python/2.7/bin $PATH

# add man pages to PATH
set PATH /usr/local/opt/erlang/lib/erlang/man $PATH

# add cargo to PATH
set PATH $HOME/.cargo/bin $PATH

# add oly to PATH
set PATH $HOME/.oly/bin $PATH

# add doom to PATH
set PATH $HOME/.emacs.d/bin $PATH

# set empty greeting
set fish_greeting

# set default key bindings
fish_default_key_bindings

# set FZF_DEFAULT_COMMAND 
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'

# set default editor
set EDITOR 'vim'
