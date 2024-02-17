#!/usr/bin/env bash
set -euo pipefail

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qall

fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update"

fish="$(which fish)"
if ! grep -q "$fish" /etc/shells; then
    echo "$fish" | sudo tee -a /etc/shells
fi
chsh -s "$fish"

touchid="auth sufficient pam_tid.so"
if ! grep -q "$touchid" /etc/pam.d/sudo_local; then
    echo "$touchid" | sudo tee -a /etc/pam.d/sudo_local
fi

fish -c "tide configure --auto --style=Rainbow --prompt_colors='16 colors' --show_time=No --rainbow_prompt_separators=Round --powerline_prompt_heads=Round --powerline_prompt_tails=Round --powerline_prompt_style='One line' --prompt_spacing=Compact --icons='Many icons' --transient=No" > /dev/null
