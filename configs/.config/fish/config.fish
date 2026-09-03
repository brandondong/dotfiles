set -U fish_greeting

set -x EDITOR msedit
set -x VISUAL msedit

fish_add_path ~/.cargo/bin/
fish_add_path ~/go/bin/

alias lg="lazygit"
alias edit="msedit"
alias ls="ls -F --color=auto"

starship init fish | source
zoxide init --cmd cd fish | source
fzf --fish | source
