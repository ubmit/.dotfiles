# load aliases
. $HOME/.config/fish/aliases.fish

# add $HOME/.local/bin to PATH
set PATH $HOME/.local/bin $PATH

# add python scripts location to PATH
set PATH $HOME/Library/Python/2.7/bin $PATH

# set vi-mode as default
fish_vi_key_bindings

# set homebrew token
set -gx HOMEBREW_GITHUB_API_TOKEN 2bc14a3d72585b527d11769254eea1b9ead4fdb0

# load fish_ssh_agent
fish_ssh_agent

# fnm
fnm env --multi --use-on-cd --shell=fish | source

# add haskell related binaries to PATH
set PATH $HOME/.cabal/bin $PATH
set PATH $HOME/.ghcup/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/guilherme/google-cloud-sdk/path.fish.inc' ]; . '/Users/guilherme/google-cloud-sdk/path.fish.inc'; end

# fzf ripgrep
set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'

# execute starship
starship init fish | source
