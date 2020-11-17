# load aliases
. $HOME/.config/fish/aliases.fish

# add $HOME/.local/bin to PATH
set PATH $HOME/.local/bin $PATH

# add python scripts location to PATH
set PATH $HOME/Library/Python/2.7/bin $PATH

# set vi-mode as default
fish_vi_key_bindings

# load fish_ssh_agent
fish_ssh_agent

# fnm
fnm env --use-on-cd --shell=fish | source

# fzf ripgrep
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'

# set fish greeting
set quotes "\"Obstacles don’t have to stop you. If you run into a wall, don’t turn around and give up. Figure out how to climb it, go through it, or work around it.\""\n"- Michael Jordan" "\"Don’t compare yourself with anyone in this world... if you do so, you are insulting yourself.\""\n"- Bill Gates" "\"Don't fly too close to the sun.\"" "\"A única coisa que ninguém pode roubar de você é o seu conhecimento.\""\n"- Mamãe"

set random_quote $quotes[(random 1 (count $quotes))]

set fish_greeting $random_quote 

# execute starship
starship init fish | source

# Load rbenv automatically by appending
status --is-interactive; and source (rbenv init -|psub)
