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
    tokei                       \
    zoxide

brew install --quiet --casks    \
    1password                   \
    arc                         \
    betterdisplay               \
    discord                     \
    firefox                     \
    google-chrome               \
    hammerspoon                 \
    httpie                      \
    intellij-idea               \
    karabiner-elements          \
    keepingyouawake             \
    proxy-audio-device          \
    raycast                     \
    rectangle-pro               \
    stats                       \
    telegram                    \
    temurin                     \
    visual-studio-code
