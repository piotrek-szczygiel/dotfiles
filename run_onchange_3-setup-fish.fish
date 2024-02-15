#!/usr/bin/env bash

fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update"

if ! grep -q "$(which fish)" /etc/shells; then
    echo "$(which fish)" | sudo tee -a /etc/shells
fi

if ! grep -q "pam_tid.so" /etc/pam.d/sudo; then
    sudo sed -i '' '2i\
auth       sufficient     pam_tid.so
' /etc/pam.d/sudo
fi

chsh -s "$(which fish)"

if read -p "Configure tide prompt (y/N): " confirmation && [[ "$confirmation" == [yY] || "$confirmation" == [yY][eE][sS] ]]; then
    fish -c "tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Dark --show_time=No --classic_prompt_separators=Vertical --powerline_prompt_heads=Round --powerline_prompt_tails=Sharp --powerline_prompt_style='One line' --prompt_spacing=Compact --icons='Many icons' --transient=No"
fi
