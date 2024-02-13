#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew &> /dev/null; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

brew tap oven-sh/bun
brew update

brew install --quiet --formulae \
    bun                         \
    eza                         \
    fd                          \
    fish                        \
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
    intellij-idea               \
    linearmouse                 \
    keepingyouawake             \
    monitorcontrol              \
    raycast                     \
    slack                       \
    stats                       \
    visual-studio-code          \
    wezterm
