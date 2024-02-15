#!/usr/bin/env bash

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

fish -c "tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Dark --show_time=No --classic_prompt_separators=Vertical --powerline_prompt_heads=Round --powerline_prompt_tails=Sharp --powerline_prompt_style='One line' --prompt_spacing=Compact --icons='Many icons' --transient=No" > /dev/null
fish -i
