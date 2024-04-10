set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx PATH "$PNPM_HOME" "$HOME/Developer/DF/scripts/aws2" "$HOME/Developer/DF/scripts" "/opt/homebrew/bin" $PATH

set -gx TESTCONTAINERS_HOST_OVERRIDE (colima ls -j | jq -r ".address")

alias q "exit"

alias l "eza  --git --icons --group-directories-first"
alias ls "eza --git --icons --group-directories-first"
alias ll "eza --git --icons --group-directories-first -lF"
alias la "eza --git --icons --group-directories-first -laF"

alias ga "git add"
alias gc "git commit"
alias gca "git commit -a"
alias gclean "git clean -ffxd :/"
alias gam "git commit --amend --no-edit"
alias gco "git checkout --"
alias gd "git diff"
alias gl "git pull"
alias glg "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp "git push"
alias grh "git reset HEAD"
alias gs "git status"

alias aws-env "bass source aws-helper"
alias python "python3"

alias pn "pnpm"

function sr
    rg --json -C 2 -i $argv | delta
end

if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

set fish_greeting

fnm env --use-on-cd | source
zoxide init fish | source
