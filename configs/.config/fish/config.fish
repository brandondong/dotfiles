set -U fish_greeting

starship init fish | source
zoxide init --no-cmd fish | source
fzf --fish | source

abbr --add cd __zoxide_z
abbr --add lg lazygit
