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
    betterdisplay               \
    httpie                      \
    karabiner-elements          \
    keepingyouawake             \
    rectangle-pro
