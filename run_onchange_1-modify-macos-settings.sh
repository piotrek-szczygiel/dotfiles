#!/usr/bin/env bash
set -euo pipefail

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
