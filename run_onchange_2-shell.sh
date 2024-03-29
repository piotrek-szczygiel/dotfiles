#!/usr/bin/env bash
set -euo pipefail

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

fish -c "tide configure --auto --style=Classic --prompt_colors='16 colors' --show_time=No --classic_prompt_separators=Vertical --powerline_prompt_heads=Round --powerline_prompt_tails=Flat --powerline_prompt_style='One line' --prompt_spacing=Sparse --icons='Many icons' --transient=No" > /dev/null

git clone https://github.com/piotrek-szczygiel/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
