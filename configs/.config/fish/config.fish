set -U fish_greeting

alias lg=lazygit

starship init fish | source
zoxide init --cmd cd fish | source
fzf --fish | source
