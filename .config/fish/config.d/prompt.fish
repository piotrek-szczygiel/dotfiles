set -g hydro_symbol_start ''
# Add spacing after a command, keeping the first prompt flush with the top.
function _prompt_spacing --on-event fish_postexec
    set -g hydro_symbol_start '\n'
end
set -g hydro_symbol_prompt '❯'
set -g hydro_symbol_git_dirty '*'
set -g hydro_color_pwd b4befe
set -g hydro_color_git 9399b2
set -g hydro_color_prompt normal
set -g hydro_color_duration brblack
set -g hydro_cmd_duration_threshold 3000

source "$__fish_config_dir/config.d/hydro.fish"

function fish_prompt --description 'Minimal inline Hydro prompt'
    set -l last_status $status
    printf '%b' "$hydro_symbol_start"
    set -l git_info (string trim --right -- "$$_hydro_git")
    set -l prompt_color $_hydro_color_prompt
    if test $last_status -ne 0; or string match --quiet '*|*' -- "$_hydro_status"
        set prompt_color $_hydro_color_error
    end

    if set -q SSH_CONNECTION
        printf '%s%s%s ' (set_color e5c07b) (prompt_hostname) "$hydro_color_normal"
    end

    set -l directory (path basename -- "$PWD")
    test "$PWD" = "$HOME"; and set directory '~'
    printf '%s%s%s' "$_hydro_color_pwd" "$directory" "$hydro_color_normal"
    if test -n "$git_info"
        # Colour only the ahead/behind counts.
        set -l upstream_color (set_color e5c07b)
        set git_info (string replace --regex '( [↑↓][0-9]+(?: [↑↓][0-9]+)?)$' "$upstream_color"'$1' -- "$git_info")
        printf '  %s %s%s' "$_hydro_color_git" "$git_info" "$hydro_color_normal"
    end
    printf ' %s%s%s ' "$prompt_color" "$hydro_symbol_prompt" "$hydro_color_normal"
end
