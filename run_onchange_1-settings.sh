#!/usr/bin/env bash
set -euo pipefail

defaults write -g com.apple.keyboard.fnState -bool true
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
