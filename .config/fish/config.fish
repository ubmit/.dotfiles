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
fnm env --multi --use-on-cd --shell=fish | source

# fzf ripgrep
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'

# set fish greeting
set fish_greeting "Don’t compare yourself with anyone in this world... if you do so, you are insulting yourself."\n"- Bill Gates"

# execute starship
starship init fish | source

# set android studio paths
set --export ANDROID_SDK_ROOT $HOME/Library/Android/sdk

set PATH $ANDROID_SDK_ROOT/emulator $PATH
set PATH $ANDROID_SDK_ROOT/tools $PATH
set PATH $ANDROID_SDK_ROOT/tools/bin $PATH
set PATH $ANDROID_SDK_ROOT/platform-tools $PATH

alias start-android-emulator "$ANDROID_SDK_ROOT/emulator/emulator @Pixel_3a_API_30_x86"

# add $HOME/.emacs.d/bin to PATH
set PATH $HOME/.emacs.d/bin $PATH
