set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx TENV_AUTO_INSTALL "true"
set -gx BUN_INSTALL "$HOME/.bun"
set -g fish_greeting ""

fish_add_path "$HOME/.local/bin"
fish_add_path "$BUN_INSTALL/bin"

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

zoxide init fish | source

if test "$hostname" != "hp-server"
    set -g hydro_symbol_start ''
    function _prompt_spacing --on-event fish_postexec
        set -g hydro_symbol_start '\n'
    end
    set -g hydro_symbol_prompt '>'
    set -g hydro_symbol_git_dirty '*'
    set -g hydro_symbol_git_ahead '↑'
    set -g hydro_symbol_git_behind '↓'
    # ANSI colors follow the terminal's palette.
    set -g hydro_color_pwd cyan
    set -g hydro_color_git yellow
    set -g hydro_color_prompt green
    set -g hydro_color_error red
    set -g hydro_color_duration brblack
    set -g hydro_multiline true
    set -g hydro_fetch false
    # Show duration only for commands taking at least five seconds.
    set -g hydro_cmd_duration_threshold 5000

    set -l hydro_dir "$__fish_config_dir/vendor/hydro"
    source "$hydro_dir/conf.d/hydro.fish"
    source "$hydro_dir/functions/fish_prompt.fish"
    source "$hydro_dir/functions/fish_mode_prompt.fish"
end
