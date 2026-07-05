set -U fish_greeting

set -x EDITOR micro
set -x VISUAL micro

fish_add_path ~/.cargo/bin/

alias lg=lazygit

starship init fish | source
zoxide init --cmd cd fish | source
fzf --fish | source
