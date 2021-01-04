# git shortcuts
alias glog "git log --all --decorate --oneline --graph"

# vim shortcuts
alias v nvim
alias vim nvim
alias vimdiff "nvim -d"

# explicitly tells tmux that the terminal supports UTF-8 
alias tmux "tmux -u" 
alias t tmux

# dotfiles
alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# use Sindresorhus trash instead of rm
alias rm "trash"

# vscode
alias code code-insiders

# yarn/npm run
alias yrun "bash $HOME/scripts/yarn-run.sh"

# use bat instead of cat 
alias cat "bat"
