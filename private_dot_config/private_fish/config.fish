set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx BUN_INSTALL "$HOME/.bun"
set -gx PATH /opt/homebrew/bin "$BUN_INSTALL/bin" "$HOME/Developer/DF/scripts" $PATH

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

alias python "python3"

function sr
    rg --json -C 2 -i $argv | delta
end

set fish_greeting
