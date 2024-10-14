set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx PATH "$HOME/Developer/DF/scripts/aws2" "$HOME/Developer/DF/scripts" "/opt/homebrew/bin" $PATH

alias q "exit"

alias l "eza  --git --icons --group-directories-first"
alias ls "eza --git --icons --group-directories-first"
alias ll "eza --git --icons --group-directories-first -lF"
alias la "eza --git --icons --group-directories-first -laF"

alias ga "git add"
alias gb "git branch --sort=committerdate | tac | grep -v '^\*' | fzf --height=20% | xargs git switch"
alias gc "git commit"
alias gca "git commit -a"
alias gclean "git clean -ffxd :/"
alias gam "git commit --amend --no-edit"
alias gco "git checkout --"
alias gd "git diff"
alias gl "git pull --rebase"
alias glg "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp "git push"
alias grh "git reset HEAD"
alias gs "git status"

alias aws-env "bass source aws-helper"
alias python "python3"

alias ftl "pushd ~/Developer/rockstar-java/src/main/frontend; bun run format && bun run tsc && bun run lint; popd"

function sr
    rg --json -C 2 -i $argv | delta
end

set fish_greeting

zoxide init fish | source
fnm env --use-on-cd --shell fish | source
