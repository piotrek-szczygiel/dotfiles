#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew &> /dev/null; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

brew tap homebrew/cask-versions
brew tap oven-sh/bun
brew update

brew install --quiet --formulae \
    awscli                      \
    bun                         \
    chezmoi                     \
    colima                      \
    coreutils                   \
    docker                      \
    eza                         \
    fd                          \
    fish                        \
    fzf                         \
    gh                          \
    git                         \
    git-delta                   \
    httpie                      \
    jq                          \
    neovim                      \
    python                      \
    ripgrep                     \
    shellcheck                  \
    tokei

brew install --quiet --casks    \
    1password                   \
    arc                         \
    corretto17                  \
    discord                     \
    hammerspoon                 \
    httpie                      \
    intellij-idea               \
    karabiner-elements          \
    keepingyouawake             \
    monitorcontrol              \
    proxy-audio-device          \
    raycast                     \
    rectangle-pro               \
    stats                       \
    telegram                    \
    visual-studio-code          \
    wezterm                     \
    zed

brew services start colima
sudo ln -sf "$HOME/.colima/default/docker.sock" /var/run/docker.sock
