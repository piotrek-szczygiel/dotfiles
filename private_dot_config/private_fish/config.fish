set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx GOPATH "$HOME/go"

fish_add_path "$GOPATH/bin"
fish_add_path "$HOME/Developer/DF/scripts/aws2"
fish_add_path "$HOME/Developer/DF/scripts"
fish_add_path "$HOME/.bun/bin"
fish_add_path "$HOME/.bin"
fish_add_path "$HOME/.opencode/bin"

alias q exit

alias l "eza  --git --icons --group-directories-first"
alias ls "eza --git --icons --group-directories-first"
alias ll "eza --git --icons --group-directories-first -lF"
alias la "eza --git --icons --group-directories-first -laF"

alias ga "git add"
alias gb "git branch --sort=committerdate | tac | grep -v '^\*' | fzf --height=20% | xargs git switch"
alias gc "git commit"
alias gco "git checkout --"
alias gd "git diff"
alias gl "git pull"
alias glg "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp "git push"
alias gs "git status"

alias ghb "gh browse"

alias tf "terraform"

alias python python3

set fish_greeting
zoxide init fish | source

# opencode
fish_add_path /Users/piotr.szczygiel/.opencode/bin
fish_add_path /Users/piotr.szczygiel/Developer/difu-refactor/bin
