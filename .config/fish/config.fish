set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx TENV_AUTO_INSTALL "true"
set -g fish_greeting ""

fish_add_path "$HOME/.local/bin"

# Keep non-interactive shells (including Hydro's Git worker) lightweight.
if not status is-interactive
    return
end

# Use the terminal palette for syntax highlighting and completion menus.
set -g fish_color_normal normal
set -g fish_color_command green
set -g fish_color_param normal
set -g fish_color_quote yellow
set -g fish_color_redirection cyan
set -g fish_color_end green
set -g fish_color_error red
set -g fish_color_comment brblack
set -g fish_color_operator cyan
set -g fish_color_escape cyan
set -g fish_color_autosuggestion brblack
set -g fish_color_valid_path --underline
set -g fish_color_selection --reverse
set -g fish_color_search_match --reverse
set -g fish_pager_color_prefix cyan --bold
set -g fish_pager_color_completion normal
set -g fish_pager_color_description yellow
set -g fish_pager_color_progress cyan
set -g fish_pager_color_selected_background --reverse

# Aliases, key bindings and interactive integrations.
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

bind f5 'commandline -r run_mote; commandline -f execute'

zoxide init fish | source

source "$__fish_config_dir/config.d/prompt.fish"
