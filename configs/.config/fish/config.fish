set -U fish_greeting

fish_add_path ~/.cargo/bin/

alias lg=lazygit

starship init fish | source
zoxide init --cmd cd fish | source
fzf --fish | source
