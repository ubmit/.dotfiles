# load aliases
. $HOME/.config/fish/aliases.fish

# load fish_ssh_agent
fish_ssh_agent

# load starship
starship init fish | source

# load fnm
fnm env --use-on-cd --shell=fish | source

# load rbenv
status --is-interactive; and source (rbenv init -|psub)

# add $HOME/.local/bin to PATH
set PATH $HOME/.local/bin $PATH

# add python scripts location to PATH
set PATH $HOME/Library/Python/2.7/bin $PATH

# add man pages to PATH
set PATH /usr/local/opt/erlang/lib/erlang/man $PATH

# add cargo to PATH
set PATH $HOME/.cargo/bin $PATH

# set empty greeting
set fish_greeting

# set vi-mode as default
fish_vi_key_bindings

# set FZF_DEFAULT_COMMAND 
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'

# change kitty colors based on time of day
if command -v "sunshine" >/dev/null
  if [ (sunshine -s "!#Porto") = "day" ]
    light-theme
  else
    dark-theme
  end
end
