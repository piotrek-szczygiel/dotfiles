#!/usr/bin/env bash
set -euo pipefail

defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
