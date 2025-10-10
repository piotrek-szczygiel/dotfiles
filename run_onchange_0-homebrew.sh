#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew &> /dev/null; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

brew tap oven-sh/bun
brew tap FelixKratz/formulae
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
    lua                         \
    jq                          \
    neovim                      \
    python                      \
    ripgrep                     \
    shellcheck                  \
    sketchybar                  \
    switchaudio-osx             \
    tokei                       \
    zoxide

brew install --quiet --casks    \
    1password                   \
    arc                         \
    betterdisplay               \
    discord                     \
    firefox                     \
    font-sf-mono                \
    font-sf-pro                 \
    google-chrome               \
    hammerspoon                 \
    httpie                      \
    intellij-idea               \
    jordanbaird-ice             \
    karabiner-elements          \
    keepingyouawake             \
    proxy-audio-device          \
    raycast                     \
    rectangle-pro               \
    sf-symbols                  \
    telegram                    \
    temurin                     \
    visual-studio-code

brew upgrade
