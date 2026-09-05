set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx TENV_AUTO_INSTALL "true"
set -gx BUN_INSTALL "$HOME/.bun"
set -g fish_greeting ""

fish_add_path "$HOME/.local/bin"
fish_add_path "$BUN_INSTALL/bin"

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

alias tf "terraform"
alias q "exit"

alias b "./build.bat"

function run_mote
    pushd "$HOME/Developer/mote"
    set -l result 0
    set -l newer_source (find src -type f \( -name '*.odin' -o -name '*.slang' \) -newer out/mote -print -quit 2>/dev/null)
    if not test -x out/mote; or test -n "$newer_source"
        ./build.bat release
        set result $status
    end
    if test $result -eq 0
        ./out/mote
        set result $status
    end
    popd
    return $result
end

bind f5 'commandline -r run_mote; commandline -f execute'

source "$HOME/.vite-plus/env.fish"
zoxide init fish | source

if test "$hostname" != "hp-server"
    starship init fish | source

    function fish_greeting
        fastfetch -s title:separator:uptime:cpu:gpu:memory:disk --logo small
    end
end
