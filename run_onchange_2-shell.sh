#!/usr/bin/env bash
set -euo pipefail

fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update"

fish="$(which fish)"
if ! grep -q "$fish" /etc/shells; then
    echo "$fish" | sudo tee -a /etc/shells
fi

current="$(dscl . -read ~/ UserShell | sed 's/UserShell: //')"
if [ "$current" != "$fish" ]; then
    chsh -s "$fish"
fi

touchid="auth sufficient pam_tid.so"
if ! grep -q "$touchid" /etc/pam.d/sudo_local; then
    echo "$touchid" | sudo tee -a /etc/pam.d/sudo_local
fi

kickstart="${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
if [ ! -d "$kickstart" ]; then
    git clone https://github.com/piotrek-szczygiel/kickstart.nvim.git "$kickstart"
fi
